extends Node2D

export(NodePath) var playerListPath

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func printMastersAndList():
	print("START DEBUG")
	print(str(NetworkGlobals.players_list))
	for p in NetworkGlobals.players_list:
		print(p)
		if(NetworkGlobals.players_list[p].has_method("sendMessage")):
			print("Van sendMessage")
			NetworkGlobals.players_list[p].rpc("sendMessage", "TEST")
	print("END DEBUG")
	

func add_player_to_the_list(playerInstance):
	get_node(str(playerListPath)).call_deferred("add_child", playerInstance)

func _on_Button_pressed():
	printMastersAndList()
