class_name ButtonHoverGreen
extends TextureButton


func _process(_delta):
	self_modulate = Color(0,1,0.52) if is_hovered() else Color.black
		