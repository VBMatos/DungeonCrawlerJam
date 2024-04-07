extends Node3D

const TRAVEL_TIME := 0.3

@onready var animation := $AnimationPlayer
@onready var audioFootsteps := $AudioFootsteps
@onready var frontRay := $FrontRay
@onready var backRay := $BackRay
@onready var leftRay := $LeftRay
@onready var rightRay := $RightRay
@onready var prompt := $Prompt
@onready var tween: Tween

@export var inventory : Inventory

func _physics_process(_delta):
	prompt.text = ""
	
	if(tween is Tween):
		if(tween.is_running()):
			return
		else:
			animation.play("idle")
			audioFootsteps.stop()

	if(Input.is_action_pressed("front") && !frontRay.is_colliding()):
		moveEvent(Vector3.FORWARD)

	if(Input.is_action_pressed("back") && !backRay.is_colliding()):
		moveEvent(Vector3.BACK)

	if(Input.is_action_pressed("left") && !leftRay.is_colliding()):
		moveEvent(Vector3.LEFT)

	if(Input.is_action_pressed("right") && !rightRay.is_colliding()):
		moveEvent(Vector3.RIGHT)

	if(Input.is_action_pressed("turnLeft")):
		turnEvent(1)

	if(Input.is_action_pressed("turnRight")):
		turnEvent(-1)

	if(frontRay.is_colliding() && frontRay.get_collider() is Interactable):
		interactEvent(frontRay.get_collider())

func interactEvent(detected):
	prompt.text = detected.get_message()
	
	if(Input.is_action_pressed("interact")):
		detected.interact(detected, inventory)

func moveEvent(direction):
	tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position", position + direction.rotated(Vector3.UP, rotation.y) * 2.0, TRAVEL_TIME)
	animation.play("walking")
	audioFootsteps.play()

func turnEvent(direction):
	tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "rotation:y", rotation.y + (direction * (PI / 2.0)), TRAVEL_TIME)
#
