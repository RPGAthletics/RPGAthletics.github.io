extends Node

onready var main_content = $Root/Background/VBoxContainer/MainContent
onready var about_content = $Root/Background/VBoxContainer/AboutContent
onready var minigame_content = $Root/Background/VBoxContainer/MinigameContent

onready var contents : Array

onready var bgm: AudioStreamPlayer = $Root/Background/VBoxContainer/MinigameContent/Minigame/AudioStreamPlayer
onready var minigame:Minigame = $Root/Background/VBoxContainer/MinigameContent/Minigame

func _ready():
	contents  = [main_content, about_content]
	_on_main_button_pressed()


func _process(delta):
	pass


func _on_lorenzo_pressed():
	OS.shell_open("https://www.youtube.com/watch?v=jcg4Ys39GoY")


func _on_about_button_pressed():
	turn_on_content(about_content)
	bgm.stop()

func _on_main_button_pressed():
	turn_on_content(main_content)
	bgm.stop()

func _on_YoutubeButton_pressed():
	OS.shell_open("https://www.youtube.com/@RPGMovement")

func turn_on_content(x):
	for content in contents:
		content.visible = content == x




func _on_Minigame_pressed():        
	turn_on_content(minigame_content)
	bgm.play()
	minigame.reset()
