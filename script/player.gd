extends CharacterBody2D

var movement_speed = 40.0

@onready var sprite = get_node("Sprite2D")
@onready var walkTimer = get_node("WalkTimer")

func _physics_process(delta):
	movement()
	
func movement():
	var x_move = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_move = Input.get_action_strength("down") - Input.get_action_strength("up")
	var move = Vector2(x_move, y_move)
	
	velocity = move.normalized() * movement_speed
	move_and_slide()
	
	if move.x > 0:
		sprite.flip_h = true
	elif move.x < 0:
		sprite.flip_h = false
