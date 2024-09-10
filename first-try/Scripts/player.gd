extends CharacterBody2D

var damage = 5
var maxHP = 100
var health = maxHP
const SPEED = 150.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var health_label: Label = $Camera2D/healthLabel
@onready var health_bottles: Node = $"../Health Bottles"
@onready var timer: Timer = $Timer
@onready var label: Label = $Camera2D/Label

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	#move_left = -1
	#move_right = 1
	
	#horizontal orientation of player
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	#player animations
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("Idle")
		else:
			animated_sprite_2d.play("Run")
	else:
		animated_sprite_2d.play("Jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	
func add_health():
	if health == 100:
		pass
	elif health > 90:
		health = maxHP
		health_label.text = "Health: " + str(health)
		health_bottles.queue_free()
	else:
		health += 10
		health_label.text = "Health: " + str(health)
		health_bottles.queue_free()
	
func get_damage(amount):
	animated_sprite_2d.play("Damage")
	health -= amount
	health_label.text = "Health: " + str(health)
	if health <= 0:
		dead()
		
func dead():
	animated_sprite_2d.play("Dead")
	label.text = "You died"
	timer.start()
	
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
