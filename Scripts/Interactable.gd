extends StaticBody3D

class_name Interactable

signal interacted(body)

@export var audio1: AudioStreamPlayer3D
@export var audio2: AudioStreamPlayer3D
@export var itemRes: ItemData

@export var message = ""
@export var simpleName = ""

func get_simple_name():
	return simpleName

func get_message():
	return message

func interact(detected, inventory: Inventory):
	if(validate_spacesuit()):
		return

	if(itemRes != null):
		inventory.insert(itemRes)

	if(audio1 != null):
		audio1.play()

	if(audio2 != null):
		audio2.play()

	emit_signal("interacted", detected)

func validate_spacesuit():
	var lsNames: Array = ["CellSlot", "EnergyCell", "Lever"]
	return !Global.hasSapaceSuit && lsNames.has(simpleName)
