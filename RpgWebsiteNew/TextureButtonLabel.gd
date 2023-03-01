tool
class_name TextureButtonLabel
extends TextureButton


export(String) var text 
export(Texture) var tex_norm
export(Color) var font_color
onready var label: Label = $"Label"


func _ready():
	texture_normal = tex_norm
	label.text = text
	label.add_color_override("font_color", font_color)
	label.set("custom_colors/font_color", font_color)
