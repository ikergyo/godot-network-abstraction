extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_JoinButton_pressed():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(NetworkGlobals.TEST_IP, NetworkGlobals.NETWORK_PORT)
	get_tree().set_network_peer(peer)
	
