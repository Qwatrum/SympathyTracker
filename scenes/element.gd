extends Control

@onready var main := get_node("/root/MainMenu")
var id

func setup(list, i):
	id = i
	if list[0] == "ghost":
		$"Icon".hide()
		$"Circle".hide()
		$"Name".hide()
		$"Value".hide()
		$"Tag".hide()
		
	else:
		$"Name".text = list[0]
		$"Value".text = str(list[1][-1])
		$"Tag".text = list[3]
		
		if list[2] == "Company":
			$"Icon".frame = 1
			
		elif list[2] == "Something else":
			$"Icon".frame = 2
			
		adjust_color(list[1][-1])
	

func adjust_color(val):
	if val < -20:
		$"Value".add_theme_color_override("font_color", Color(0.5, 0, 0))
	elif val < 0:
		$"Value".add_theme_color_override("font_color", Color(1, 0, 0))
	elif val < 15:
		$"Value".add_theme_color_override("font_color", Color(1, 0.3, 0))
	elif val < 25:
		$"Value".add_theme_color_override("font_color", Color(1, 0.5, 0))
	elif val < 50:
		$"Value".add_theme_color_override("font_color", Color(1, 0.7, 0))
	elif val < 75:
		$"Value".add_theme_color_override("font_color", Color(1, 1, 0))
	elif val < 100:
		$"Value".add_theme_color_override("font_color", Color(0.5, 1, 0))
	elif val < 125:
		$"Value".add_theme_color_override("font_color", Color(0.3, 1, 0))
	elif val < 150:
		$"Value".add_theme_color_override("font_color", Color(0, 1, 0))
	else:
		$"Value".add_theme_color_override("font_color", Color(0, 0.7, 0))



func _on_background_pressed():
	print(id)
	main.view(id)
