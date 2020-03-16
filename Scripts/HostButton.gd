extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_HostButton_pressed():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(NetworkGlobals.NETWORK_PORT, NetworkGlobals.MAX_PLAYERS)
	get_tree().set_network_peer(peer)
	
