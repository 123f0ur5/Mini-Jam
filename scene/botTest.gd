extends CharacterBody2D

func on_damage_received():
  # Function called when damage is recieved
	queue_free()  # Destroy the bot
