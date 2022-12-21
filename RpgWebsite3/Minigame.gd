class_name Minigame
extends Node2D


export(PackedScene) var rock

onready var timer:Timer = $Timer
var points = 0


func _ready():
	reset()
	
func reset():
	timer.wait_time = randf() * 0.5 + 0.5
	timer.start()
	for child in $Rocks.get_children():
		child.queue_free()



func _on_Timer_timeout():
	var asd = rock.instance()
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
