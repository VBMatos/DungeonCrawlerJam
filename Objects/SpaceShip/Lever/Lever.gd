extends Node3D

@onready var animation := $AnimationPlayer2

signal leverPushed

func _ready():
	animation.stop(true)
	
func pushLever():
	$Timer.start()

func _on_timer_timeout():
	leverPushed.emit()
