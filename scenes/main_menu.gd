extends Control

var pallete = "https://coolors.co/f4f4f4-7a3b69-eb5e28-124e78-f2bb05"
var add_screen = preload("res://scenes/add_screen.tscn")
var new_element = preload("res://scenes/element.tscn")
var view_screen = preload("res://scenes/view_screen.tscn")

var last_id = 0
var elements = []

var viewer

func _ready():
	# TODO: loading data
	pass


func _on_add_button_down():
	$"Add".hide()
	var inste = add_screen.instantiate()
	add_child(inste)
	inste.position = Vector2(349,146)


func add_element(new_e, toList):
	$"Add".show()
	var inste = new_element.instantiate()
	if toList:
		elements.append(new_e)
	else:
		last_id = 0
	
	
	if $"ScrollContainer/Elements".get_child_count() >= 8:
		if $"ScrollContainer/Elements".get_child_count() != 8:
			$"ScrollContainer/Elements".get_children()[-1].queue_free()
		$"ScrollContainer/Elements".add_child(inste)
		if toList:
			last_id+=1
		inste.setup(new_e, last_id)
		
		
		var ghost = new_element.instantiate()
		$"ScrollContainer/Elements".add_child(ghost)
		ghost.setup(["ghost"], -2)
	
	else:
		$"ScrollContainer/Elements".add_child(inste)
		if toList:
			last_id+=1
		inste.setup(new_e, last_id)
		
	#print(last_id)

func view(id):
	#print(id)
	if viewer:
		viewer.queue_free()
		viewer = false
		
	var inste = view_screen.instantiate()
	add_child(inste)
	inste.position = Vector2(259,61)
	inste.create(elements[id-1], id)
	viewer = inste

func apply_changes(id, list):
	elements[id-1] = list
	for f in $"ScrollContainer/Elements".get_children():
		f.queue_free()
	#print(last_id)
	for e in elements:
		add_element(e, false)
	#print(last_id)
		
func show_add():
	$"Add".show()
func reset_viewer():
	viewer = false
