extends Panel
@onready var main := get_parent()

func _on_cancel_pressed():
	main.show_add()
	queue_free()


