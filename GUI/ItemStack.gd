class_name ItemStack extends Panel

@onready var itemSprite := $Item

var inventoryItem: InventoryItem

func update():
	if (!inventoryItem):
		return
		
	itemSprite.visible = true
	itemSprite.texture = inventoryItem.texture
