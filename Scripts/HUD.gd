extends CanvasLayer

@onready var hudStats := $Stats
@onready var hudInventory := $Inventory

func _ready():
	pass

func _on_space_suit_2_interacted(detected):
	hudStats.visible = true
	hudInventory.visible = true
	
	detected.position.y = detected.position.y + 5
	
	Global.hasSapaceSuit = true

func _on_energy_cell_interacted(detected):
	if(Global.hasSapaceSuit):
		detected.position.y = detected.position.y + 5

func _on_monitor_interacted(detected):
	pass #Opens a detailed screen
