extends VBoxContainer

@onready var inventory : Inventory = preload("res://Inventory/PlayerInventory.tres")
@onready var itemStackClass = preload("res://GUI/Panel.tscn")
@onready var slots : Array = $".".get_children()

var itemInHand: InventoryItem

func _ready():
	connectSlots()
	inventory.updated.connect(update)
	update()

func connectSlots():
	for i in range(slots.size()):
		var slot = slots[i]
		slot.index = i
		
		var callable = Callable(onSlotClicked).bind(slot)
		slot.button_down.connect(callable)

func update():
	for i in range(min(inventory.items.size(), slots.size())):
		var inventoryItem : ItemData = inventory.items[i]
		
		if(!inventoryItem):
			continue
			
		var invItem: InventoryItem = slots[i].inventoryItem
		
		if(!invItem):
			invItem = itemStackClass.instantiate()
			slots[i].tooltip_text = inventoryItem.name
			slots[i].insert(invItem)

		invItem.inventoryItem = inventoryItem
		invItem.tooltip_text = inventoryItem.name
		invItem.update()

func onSlotClicked(slot):
	if(slot.isEmpty() && itemInHand):
		insertItemInSlot(slot)
		return
	
	if(!slot.isEmpty() && !itemInHand):
		takeItemFromSlot(slot)

func takeItemFromSlot(slot):
	itemInHand = slot.takeItem()
	slot.tooltip_text = ""
	
	add_child(itemInHand)
	updateItemInHand()

func insertItemInSlot(slot):
	var item = itemInHand
	
	remove_child(itemInHand)
	itemInHand = null
	
	slot.insert(item)
	slot.tooltip_text = item.inventoryItem.name

func updateItemInHand():
	if(!itemInHand):
		return
	
	itemInHand.global_position = get_global_mouse_position() - (itemInHand.size / 2)
	
func _input(event):
	updateItemInHand()
