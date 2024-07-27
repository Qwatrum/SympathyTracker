extends Control

var pallete = "https://coolors.co/f4f4f4-7a3b69-eb5e28-124e78-f2bb05"
var add_screen = preload("res://scenes/add_screen.tscn")

func _ready():
	# TODO: loading data
	pass


func _on_add_button_down():
	$"Add".hide()
	var inste = add_screen.instantiate()
	add_child(inste)
	inste.position = Vector2(349,146)
