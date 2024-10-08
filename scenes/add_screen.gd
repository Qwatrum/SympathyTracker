extends Panel

@onready var main := get_parent()


func _on_value_value_changed(value):
	$"TextSlider".text = "Start value: "+str(round(value))


func _on_cancel_pressed():
	queue_free()
	main.show_add()


func _on_add_pressed():
	if $"Name".text != "" and $"Type".text != "Select Type":
		var new_element = [$"Name".text, [$"Value".value], $"Type".text, $"Tag".text, $"Notes".text, -1] # -1 is the placeholder
		main.add_new_element(new_element)
		queue_free()
