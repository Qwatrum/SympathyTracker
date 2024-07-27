extends Panel


func _on_value_value_changed(value):
	$"TextSlider".text = "Start value: "+str(round(value))


func _on_cancel_pressed():
	queue_free()
