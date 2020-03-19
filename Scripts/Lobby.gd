# Typical lobby implementation; imagine this being in /root/lobby.

extends Node


export (NodePath) var lobbyMainPanel
export (NodePath) var lobbyStartPanel
export (NodePath) var readyPanel
export (NodePath) var playerList
# Connect all functions

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")

# Player info, associate ID to data
var player_info = {}
var my_id

func _player_connected(id):
	#We restrict that it will be called only on the server, anything and it will send the datas to the connected nodes.
	print("My id: " + str(get_tree().get_network_unique_id()))
	print("_player_connected input ID: " + str(id))
	# Called on both clients and server when a peer connects. Send my info to it.
	rpc_id(id, "register_player")

func _player_disconnected(id):
	player_info.erase(id) 
	refreshReadyList()

func _connected_ok():
	pass # Only called on clients, not server. Will go unused; not useful here.

func _server_disconnected():
	pass # Server kicked us; show error and abort.

func _connected_fail():
	pass # Could not even connect to server; abort.

remote func register_player():
	# Get the id of the RPC sender.
	var id = get_tree().get_rpc_sender_id()
	if (get_tree().is_network_server()):
		var new_player_info = { player_id = id, ready = false}
		player_info[id] = new_player_info
	
	if(!player_info.has(my_id)):
		var my_player_info = { player_id = my_id, ready = false}
		player_info[my_id] = my_player_info

	print("RPC sender ID, after connect: " + str(id))
	print("Local player_info dictionary" + str(player_info))
	refreshReadyList()

remote func pre_configure_game():
	var selfPeerID = get_tree().get_network_unique_id()

	# Load world
	var world = load("res://Scenes/PlayScene.tscn").instance()
	get_node("/root").add_child(world)

	# Load my player
	var my_player = preload("res://Scenes/Player.tscn").instance()
	my_player.set_name(str(selfPeerID))
	my_player.set_network_master(selfPeerID) # Will be explained later
	get_node("/root/world/players").add_child(my_player)

	# Load other players
	for p in player_info:
		var player = preload("res://Scenes/Player.tscn").instance()
		player.set_name(str(p))
		player.set_network_master(p) # Will be explained later
		get_node("/root/Play/PlayersContainer").add_child(player)

	# Tell server (remember, server is always ID=1) that this peer is done pre-configuring.
	rpc_id(1, "done_preconfiguring", selfPeerID)

func addItem(id, status):
	var readyPlayer = preload("res://Scenes/LobbyPlayer.tscn").instance()
	readyPlayer.setPlayerId(id)
	if(status):
		readyPlayer.setStatus("Ready")
	else:
		readyPlayer.setStatus("Not ready")

func removeItem(id):
	var i = 0
	for child in range(0, get_node(str(playerList)).get_child_count()):
		if id == get_node(str(child)).getPlayerId():
			get_node(str(playerList)).remove_child(i)
			i += 1
			

func refreshReadyList():
	get_node(str(playerList)).clear()
	for p in player_info:
		var status = "Not ready"
		if (player_info[p].ready):
			status = "Ready"
		get_node(str(playerList)).add_item("ID: " + str(player_info[p].player_id) + " Status: " + status)
		



func _on_JoinButton_pressed():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(NetworkGlobals.TEST_IP, NetworkGlobals.NETWORK_PORT)
	get_tree().set_network_peer(peer)
	get_node(str(lobbyStartPanel)).hide()
	get_node(str(readyPanel)).show()
	
	my_id = get_tree().get_network_unique_id()
	
	refreshReadyList()
	
func _on_HostButton_pressed():
	
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(NetworkGlobals.NETWORK_PORT, NetworkGlobals.MAX_PLAYERS)
	get_tree().set_network_peer(peer)
	get_node(str(lobbyStartPanel)).hide()
	get_node(str(readyPanel)).show()
	
	my_id = get_tree().get_network_unique_id()
	
	player_info[my_id] = { player_id = my_id, ready = false }
	
	refreshReadyList()
	

remote func setPlayerStatus(player_id, readyStatus):
	player_info[player_id].ready = readyStatus
	print("My_id" + str(my_id) + "PLAYER INFOS: " + str(player_info))
	
	refreshReadyList()

func _on_ReadyButton_pressed():
	player_info[my_id].ready = true
	rpc("setPlayerStatus", my_id, true)
	
