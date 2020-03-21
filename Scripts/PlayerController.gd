extends Panel

export(NodePath) var playerNamePath
export(NodePath) var messagePath

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_name(name):
	get_node(str(playerNamePath)).set_text(name)
	
func addMessage(newMessage):
	var messages = get_node(str(messagePath)).get_text()
	get_node(str(messagePath)).set_text(messages + newMessage)
