extends CharacterBody2D


var movement_speed = 40.0
var min_distance = 100;

@onready var sprite = get_node("Sprite2D")
@onready var walkTimer = get_node("WalkTimer")

func _physics_process(delta):
	movement()
	
	# Kill Action
	check_attack()

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

func kill_survivor(survivor):
	survivor.on_damage_received()

func find_closest_survivor():
	var closest_survivor = null
	var closest_distance = min_distance

	for survivor in get_tree().get_nodes_in_group("SurvivorGroup"):
		if is_instance_valid(survivor):
			var distance = position.distance_to(survivor.global_position)
			if distance < closest_distance:
				closest_distance = distance
				closest_survivor = survivor

	return closest_survivor

func check_attack():
	if Input.is_action_just_pressed("ui_accept"):
		var closest_survivor : Node2D = find_closest_survivor()

		if closest_survivor != null and closest_survivor.position.distance_to(global_position) < min_distance:
			kill_survivor(closest_survivor as Node2D)
