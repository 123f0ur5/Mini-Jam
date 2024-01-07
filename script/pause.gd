extends Control
	
func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		visible = !visible
		get_tree().paused = !get_tree().paused

func _ready():
	visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_resume_game_pressed():
	visible = false
	get_tree().paused = false
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
