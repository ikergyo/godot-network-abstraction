extends HBoxContainer


export (NodePath) var playerId
export (NodePath) var status

var player_id

func setPlayerId(id):
	player_id = id
	get_node(str(playerId)).set_text(str(id))
	
func getPlayerId():
	return player_id
	
func setStatus(status):
	get_node(str(playerId)).set_text(str(status))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
