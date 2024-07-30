extends Panel
@onready var main := get_node("/root/MainMenu")


func _on_delete_pressed():
	main.delete_all()
	queue_free()


func _on_cancel_pressed():
	queue_free()
