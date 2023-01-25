class_name Minigame
extends Node2D


export(PackedScene) var rock
export(PackedScene) var fireball

onready var timer:Timer = $Timer
onready var crouch_button:Button = $Instructions/CrouchButton
onready var choose_characters = $Instructions/ChooseCharacterPanel/ChooseCharacterLabel/ChooseCharacters
var points = 0
var playing = false

func _ready():
	reset()
	for child in choose_characters.get_children():
		var choice = child as TextureButton
		choice.connect("pressed", self, "choice_pressed", [choice.texture_normal])
	
func reset():
	timer.wait_time = randf() * 0.5 + 0.5
	timer.start()
	for child in $Rocks.get_children():
		child.queue_free()



func _on_Timer_timeout():
	if not playing:
		return
	var asd =  [
		rock, fireball
	][randi()%2].instance()
	timer.wait_time = randf() * 0.5 + 0.5
	$Rocks.add_child(asd)


func _on_CollectionArea_body_entered(body):
	if body is Hazard:
		points += 1
		$Control/Score.text	 = "Score: %d"%points


func _on_CollectionArea_area_entered(area):
	if area is Hazard:
		points += 1
		$Control/Score.text	 = "Score: %d"%points
		area.queue_free()
		$RankUpPlayer.play()


func _on_Area2D_area_entered(area):
	if area is Hazard:
		$CritPlayer.play()
		points -= 5
		area.queue_free()
		$Control/Score.text	 = "Score: %d"%points
		
func choice_pressed(texture):
	$Player/Sprite.texture = texture
