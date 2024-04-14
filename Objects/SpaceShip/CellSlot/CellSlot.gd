extends Node3D

@onready var animation := $AnimationPlayer2

func _ready():
	animation.stop(true)
