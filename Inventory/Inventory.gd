class_name Inventory extends Resource

@export var items : Array[InventoryItem]

signal updated

func insert(item : InventoryItem):
	for i in range(items.size()):
		if(items[i] && items[i].name == item.name):
			break
		elif(!items[i]):
			items[i] = item
			break
	
	updated.emit()

func removeItemAtIndex(index: int):
	items[index] = InventoryItem.new()
	
func insertSlot(index: int, inventoryItem: InventoryItem):
	var oldIndex: int = items.find(inventoryItem)
	removeItemAtIndex(oldIndex)
	
	items[index] = inventoryItem
