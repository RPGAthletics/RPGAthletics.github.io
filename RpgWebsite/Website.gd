extends Node

@onready var main_content = $Root/Background/VBoxContainer/MainContent
@onready var about_content = $Root/Background/VBoxContainer/AboutContent

@onready var contents: Array[Control] = [main_content, about_content]


func _ready():
	_on_main_button_pressed()


func _process(delta):
	pass


func _on_lorenzo_pressed():
	OS.shell_open("https://www.youtube.com/watch?v=jcg4Ys39GoY")


func _on_youtube_pressed():
	OS.shell_open("https://www.youtube.com/@RPGMovement")


func _on_about_pressed():
	turn_on_content(about_content)


func _on_main_button_pressed():
	turn_on_content(main_content)


func turn_on_content(x):
	for content in contents:
		content.visible = content == x
