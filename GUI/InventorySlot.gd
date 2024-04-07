extends Button

@onready var bgSprite := $Background
@onready var container := $CenterContainer

@export var inventory = preload("res://Inventory/PlayerInventory.tres")

var itemStack: ItemStack
var index: int

func insert(iStack : ItemStack):
	itemStack = iStack
	bgSprite.frame = 1
	container.add_child(itemStack)

	if(!itemStack.inventoryItem || inventory.items[index] == itemStack.inventoryItem):
		return
	
	inventory.insertSlot(index, itemStack.inventoryItem)

func takeItem():
	var item = itemStack
	
	container.remove_child(itemStack)
	itemStack = null
	bgSprite.frame = 0
	
	return item

func isEmpty():
	return !itemStack
