extends Node3D

@onready var animation := $AnimationPlayer2

func _ready():
	animation.stop(true)
	
	var mapNode := get_parent().get_parent()
	var children := mapNode.get_children()
	children[5].get_children()[0].leverPushed.connect(openCargoDoor)

func openCargoDoor():
	animation.play()
	
	var collision = get_parent().get_children()[1]
	collision.queue_free()
