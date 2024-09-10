extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void: #body is referencing the player since the only thing entering the killzone is the player so we can use this to reference the player
	body.get_node("CollisionShape2D").queue_free()#removes collision shape when we enter killzone so we don't have physics and fall through the ground
	print("You Died")
	Engine.time_scale = 0.5 #slowmo when we die, 0.5 = half speed
	timer.start() #Timer starts counting to 1 second


func _on_timer_timeout() -> void: #This function executes when timer ends
	Engine.time_scale = 1 #Returns game speed to normal when we respawn
	get_tree().reload_current_scene() #reloads current scene
