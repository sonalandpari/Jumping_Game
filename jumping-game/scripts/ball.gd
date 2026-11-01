extends CharacterBody2D

var JUMP_VELOCITY = -1500
var GRAVITY= 4200

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY* delta
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
	move_and_slide()
