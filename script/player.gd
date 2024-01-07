extends CharacterBody2D

const attack_button = KEY_SPACE

var movement_speed = 40.0
var distancia_aceitavel = 30;
var som_ataque

@onready var sprite = get_node("Sprite2D")
@onready var walkTimer = get_node("WalkTimer")

func _physics_process(delta):
	movement()
	
	# Kill Action
	if Input.is_action_just_pressed("ui_accept"):
		if is_instance_valid($/root/Main/World/BotTest) and position.distance_to($/root/Main/World/BotTest.position) < distancia_aceitavel:
			$/root/Main/World/BotTest.on_damage_received()
	

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
