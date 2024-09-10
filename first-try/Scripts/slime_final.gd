extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_castleft: RayCast2D = $RayCastleft
@onready var ray_castright: RayCast2D = $RayCastright

const speed = 60
var direction = 1
var hitValue = 10

func _process(delta: float) -> void:
	if ray_castleft.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	if ray_castright.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	
	position.x += speed * direction * delta



func _on_body_entered(body: Node2D) -> void:
	if 'get_damage' in body:
		body.get_damage(hitValue)
