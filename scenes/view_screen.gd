extends Panel

@onready var main := get_parent()
var new_list
var id

var old_values = []
var v_save = []
var last_x = 145
var x_begin = 145
var x_end = 755
var y_begin = 300
var y_end = 0

func create(list, i):
	
	for e in list[1]:
		old_values.append(e)
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
	$"Value".text = str(list[1][-1])
	adjust_color(int($"Value".text))
	show_graph(list[1])
	v_save = list[1]


func _on_cancel_pressed():
	queue_free()
	main.show_add()
	main.reset_viewer()

func save_changes():
	main.apply_changes(id, new_list)
	


func _on_save_pressed():
	old_values.append(int($"Value".text))
	new_list = [$"Name".text, old_values, $"Type".text, $"Tag".text, $"Notes".text, id]
	save_changes()
	queue_free()


func _on_up_pressed():
	var v = int($"Value".text)
	
	if v != 150:
		v+=1
		$"Value".text = str(v)
		adjust_color(v)
		show_graph(old_values+[v])


func _on_down_pressed():
	var v = int($"Value".text)
	
	if v != -150:
		v-=1
		$"Value".text = str(v)
		adjust_color(v)
		show_graph(old_values+[v])
	
	
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

func show_graph(values):
	if len(values) == 1:
		values.append(values[0])

	var amount = len(values)

	var p = []
	var step_x = (x_end - x_begin) / (amount - 1)
	
	for i in range(amount):
		var x = last_x + i * step_x
		var y = y_begin - values[i] - 140
		p.append(Vector2(x, y))
	$"Line".points = p

