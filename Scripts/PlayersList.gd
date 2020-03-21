extends Node2D

export(NodePath) var playerListPath

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_player_to_the_list(playerInstance):
	get_node(str(playerListPath)).call_deferred("add_child", playerInstance)
