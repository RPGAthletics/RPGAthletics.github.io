class_name Hazard
extends Area2D

export(int) var speed
export(int) var spawn_y

func _physics_process(delta):
	global_position.x -= speed * delta
	




