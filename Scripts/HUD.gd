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
		pass #Abre tela do monitor com os dados sobre a queda da nave.

func _on_cell_slot_interacted(detected):
	if(Global.hasSapaceSuit && !Global.hasPutEnergyCell_L1 && 
	   hudInventory.itemInHand && hudInventory.itemInHand.inventoryItem.name == "Energy Cell"):
		
		hudInventory.remove_child(hudInventory.itemInHand)
		hudInventory.itemInHand = null
	
		var node: Node3D = detected.get_children()[0]
		var anim: AnimationPlayer = node.get_children()[1]
		
		anim.play("animation_put_cell")
		Global.hasPutEnergyCell_L1 = true
	
	#Inicia animação de encaixe da Célula do cenário.

func _on_lever_interacted(body):
	if(Global.hasSapaceSuit && Global.hasPutEnergyCell_L1 && !Global.hasPushLever_L1):
		pass #Start pushing animation.
