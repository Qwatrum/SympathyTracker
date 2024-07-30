extends Panel
@onready var main := get_parent()

var confirm = preload("res://scenes/confirm_view.tscn")

func _on_cancel_pressed():
	main.show_add()
	queue_free()



func _on_delete_pressed():
	var inste = confirm.instantiate()
	add_child(inste)
