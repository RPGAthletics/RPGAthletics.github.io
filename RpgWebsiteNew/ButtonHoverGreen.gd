extends TextureButton


func _process(delta):
	self_modulate = Color(0,1,0.52) if is_hovered() else Color.black
		