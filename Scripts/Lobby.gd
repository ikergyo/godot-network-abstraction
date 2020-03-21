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

#It is necessary for initialize datas, because if you were in a lobby before, and you disconnect and join or create an other, then you need to initialize datas. 
#If in this case you don't, then there will be some bugs, or anomaly because you can see some old data
func init():
	player_info.clear()
	my_id=null

func _player_connected(id):
	#We restrict that it will be called only on the server, anything and it will send the datas to the connected nodes.
	if(get_tree().is_network_server()):
		var new_player_info = { player_id = id, ready = false}
		player_info[id] = new_player_info
		refreshReadyList()
		for p in player_info:
			rpc_id(id, "register_player", player_info[p])
			
		print("My id: " + str(get_tree().get_network_unique_id()))
		print("_player_connected input ID: " + str(id))

func _player_disconnected(id):
	player_info.erase(id) 
	refreshReadyList()

func _connected_ok():
	pass # Only called on clients, not server. Will go unused; not useful here.

func _server_disconnected():
	to_disconnect()

func _connected_fail():
	pass # Could not even connect to server; abort.

remote func register_player(new_player):
	# Get the id of the RPC sender.
	player_info[new_player.player_id] = new_player
	refreshReadyList()

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
			
remotesync func setPlayerStatus(player_id, readyStatus):
	player_info[player_id].ready = readyStatus
	print("My_id" + str(my_id) + "PLAYER INFOS: " + str(player_info))
	refreshReadyList()
	checkReady()

func refreshReadyList():
	get_node(str(playerList)).clear()
	for p in player_info:
		var status = "Not ready"
		if (player_info[p].ready):
			status = "Ready"
		get_node(str(playerList)).add_item("ID: " + str(player_info[p].player_id) + " Status: " + status)
		
func checkIsEveryoneReady():
	for p in player_info:
		if (!player_info[p].ready):
			return false
	return true

func checkReady():
	if(checkIsEveryoneReady()):
		rpc("pre_configure_game")
		
remotesync func pre_configure_game():
	get_tree().set_pause(true)
	
	# Load world
	var world = load("res://Scenes/PlayScene.tscn").instance()
	get_node("/root").call_deferred("add_child", world)
	get_node(str(lobbyMainPanel)).hide()

	# Load my player
	var my_player = preload("res://Scenes/Player.tscn").instance()
	my_player.set_name(str(my_id))
	if(!get_tree().is_network_server()):
		my_player.set_network_master(my_id) # Will be explained later
	world.add_player_to_the_list(my_player)

	# Load other players
	for p in player_info:
		if p == my_id:
			continue
		var player = preload("res://Scenes/Player.tscn").instance()
		player.set_name(str(p))
		player.set_network_master(p) 
		world.add_player_to_the_list(player)
	# Tell server (remember, server is always ID=1) that this peer is done pre-configuring.
	rpc_id(1, "done_preconfiguring", my_id)

var players_done = []

remote func done_preconfiguring(who):
	# Here are some checks you can do, for example
	assert(get_tree().is_network_server())
	assert(who in player_info) # Exists
	assert(not who in players_done) # Was not added yet

	players_done.append(who)

	if players_done.size() == player_info.size():
		rpc("post_configure_game")

remotesync func post_configure_game():
	get_tree().set_pause(false)
	# Game starts now!
	
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

func _on_ReadyButton_pressed():
	#player_info[my_id].ready = true
	rpc("setPlayerStatus", my_id, true)
	refreshReadyList()

func to_disconnect():
	#It will disconnect. If this is the server, the paramter is relvant because it means, it will be closed after that time (it is in usec)
	#In this case, almost immediately
	get_tree().get_network_peer().close_connection(1)
	#Maybe it is not necessary, but not problem to set null, because maybe there will be an offline mode, and it is disable the online things.
	get_tree().set_network_peer(null)
	get_node(str(lobbyStartPanel)).show()
	get_node(str(readyPanel)).hide()
	init()
	
	#You can kick player with: disconnect_peer method.

func _on_BackButton_pressed():
	to_disconnect()
	
