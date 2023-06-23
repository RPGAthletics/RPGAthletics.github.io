class_name TextureButtonHoverGreen
extends TextureButton


func _process(_delta):
	self_modulate = MyColors.RPG_GREEN if is_hovered() else Color.BLACK
		