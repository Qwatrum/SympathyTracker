extends Control

var pallete = "https://coolors.co/f4f4f4-7a3b69-eb5e28-124e78-f2bb05"
var add_screen = preload("res://scenes/add_screen.tscn")
var new_element = preload("res://scenes/element.tscn")
var view_screen = preload("res://scenes/view_screen.tscn")
var info_screen = preload("res://scenes/info_screen.tscn")

var last_id = 0
var elements = []
var elements_copy = []

var searching = false
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
	viewer = false
	elements[id-1] = list
	for f in $"ScrollContainer/Elements".get_children():
		f.queue_free()
	#print(last_id)
	for e in elements:
		add_element(e, false)
	#print(last_id)
		
func show_add():
	$"Add".show()
	$"Info".show()
func reset_viewer():
	viewer = false



func _on_info_pressed():
	$"Info".hide()
	$"Add".show()
	
	var inste = info_screen.instantiate()
	add_child(inste)
	inste.position = Vector2(259,61)




func _on_search_pressed():
	var search = $"SearchText".text
	if search != "":
		$"Search".hide()
		$"CancelSearch".show()
		elements_copy = elements.duplicate()
		
		var search_elements = []
		for e in elements:
			var add = false
			for ee in e:
				if str(ee).contains(search):
					add = true
			if add:
				search_elements.append(e)
		
		for c in $"ScrollContainer/Elements".get_children():
			c.queue_free()
		
		for l in search_elements:
			add_element(l, false)


func _on_cancel_search_pressed():
	for c in $"ScrollContainer/Elements".get_children():
		c.queue_free()
		
	$"SearchText".text = ""
	$"CancelSearch".hide()
	$"Search".show()
	
	if len(elements_copy) != 0:
		elements = elements_copy.duplicate()
		elements_copy = []
		
		for e in elements:
			add_element(e, false)
		
