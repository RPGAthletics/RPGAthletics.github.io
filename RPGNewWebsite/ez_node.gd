extends Node
class_name EzNode


func _ready():
	var this_script: Script = get_script()
	for property_info in this_script.get_script_property_list():
		var property_name: String = property_info.name
		if property_name.ends_with(".gd"):
			continue
		var path = find_child(property_name)
		if property_info["class_name"].length() == 0:
			continue
		if ClassDB.class_exists(property_info["class_name"]):
			set(property_name, path)
		if get(property_name) == null:
			print("%s is null in %s: %s" % [property_name, name, get_class()])
