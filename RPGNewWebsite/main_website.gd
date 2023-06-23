extends EzNode

var bg_with_guy: TextureRect
var button_rpg_logo: TextureButton


func _ready():
	super()
	button_rpg_logo.connect("pressed", func(): print("hello world!"))
