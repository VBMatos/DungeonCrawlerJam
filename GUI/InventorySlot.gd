extends Button

@onready var bgSprite := $Background
@onready var container := $CenterContainer

@export var inventory = preload("res://Inventory/PlayerInventory.tres")

var inventoryItem: InventoryItem
var index: int

func insert(invItem : InventoryItem):
	inventoryItem = invItem
	bgSprite.frame = 1
	
	container.add_child(inventoryItem)

	if(!inventoryItem.inventoryItem || inventory.items[index] == inventoryItem.inventoryItem):
		return
	
	inventory.insertSlot(index, inventoryItem.inventoryItem)

func takeItem():
	var item = inventoryItem
	
	container.remove_child(inventoryItem)
	inventoryItem = null
	bgSprite.frame = 0
	
	return item

func isEmpty():
	return !inventoryItem
