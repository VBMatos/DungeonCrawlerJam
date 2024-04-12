class_name InventoryItem extends Panel

@onready var itemSprite := $Item

var inventoryItem: ItemData

func update():
	if (!inventoryItem):
		return
		
	itemSprite.visible = true
	itemSprite.texture = inventoryItem.texture
