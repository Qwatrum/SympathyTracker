extends Resource
class_name Data

@export var elements_saved = []

func change_saved_elements(new_list):
	elements_saved = new_list

func delete_all_elements():
	elements_saved = []
