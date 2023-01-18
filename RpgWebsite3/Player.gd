extends KinematicBody2D

export(int) var gravity 
export(int) var jump_power 
var velocity: Vector2
var is_crouching: bool = false 
var crouch_weakness: bool = false

onready var jump_player:AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_just_pressed("jump"):
		jump()
	
	if Input.is_action_just_pressed("crouch"):
		crouch()
		

func _physics_process(delta):
	velocity.x = 0
	velocity.y += gravity * delta
	move_and_slide(velocity, Vector2(0, -1))
	


func _on_MouseGetter_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			jump()

func jump():
	if not is_on_floor():
		return
	velocity.y = -jump_power
	jump_player.play()

func crouch():
	if is_crouching or crouch_weakness:
		return
	is_crouching = true
	crouch_weakness = true
	var timer = get_tree().create_timer(0.5)
	timer.connect("timeout", self, "stand")
	scale.y = 0.4

func stand():
	scale.y = 0.75
	is_crouching = false
	var timer = get_tree().create_timer(0.1)
	timer.connect("timeout", self, "crouch_weakness")

func crouch_weakness():
	crouch_weakness = false
	


func _on_CrouchButton_pressed():
	crouch()
