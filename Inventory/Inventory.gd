class_name Inventory extends Resource

@export var items : Array[ItemData]

signal updated

func insert(item : ItemData):
	for i in range(items.size()):
		if(items[i] && items[i].name == item.name):
			break
		elif(!items[i]):
			items[i] = item
			break
	
	updated.emit()

func removeItemAtIndex(index: int):
	items[index] = ItemData.new()
	
func insertSlot(index: int, inventoryItem: ItemData):
	var oldIndex: int = items.find(inventoryItem)
	removeItemAtIndex(oldIndex)
	
	items[index] = inventoryItem
