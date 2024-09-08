extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("You Died")
	timer.start() #Timer starts counting to 1 second


func _on_timer_timeout() -> void: #This function executes when timer ends
	get_tree().reload_current_scene() #reloads current scene
