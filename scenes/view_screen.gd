extends Panel

@onready var main := get_parent()
var new_list
var id

func create(list, i):
	id = i
	$"Name".text = list[0]
	$"Type".text = list[2]
	
	'''
	if list[2] == "Person":
		$"Type".set_item_id(0)
		
	elif list[2] == "Company":
		$"Type".set_item_id(1)
	else:
		$"Type".set_item_id(2)
		'''
	
	$"Tag".text = list[3]
	$"Notes".text = list[4]


func _on_cancel_pressed():
	queue_free()
	main.show_add()
	main.reset_viewer()

func save_changes():
	main.apply_changes(id, new_list)


func _on_save_pressed():
	new_list = [$"Name".text, 0, $"Type".text, $"Tag".text, $"Notes".text] # zero is temp
	save_changes()
	queue_free()
