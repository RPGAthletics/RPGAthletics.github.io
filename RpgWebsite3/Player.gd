extends KinematicBody2D

export(int) var gravity 
export(int) var jump_power 
var velocity: Vector2

onready var jump_player:AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	velocity.x = 0
	velocity.y += gravity * delta
	move_and_slide(velocity, Vector2(0, -1))
	


func _on_MouseGetter_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT \
			and event.pressed \
			and is_on_floor():
			velocity.y = -jump_power
			jump_player.play()
