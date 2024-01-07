extends Node2D


var numeroNPCs = 20
var arraySurvivors = []
var survivor_scene = preload("res://scene/mob.tscn")

func _ready():
	for i in numeroNPCs:
		add_survivor()

	pass # Replace with function body.

func add_survivor():
	var survivor = survivor_scene.instantiate()
	arraySurvivors.append(survivor)
	add_child(survivor)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
