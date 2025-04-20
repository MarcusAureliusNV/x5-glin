extends Node2D

var SPEED = 60

var direction = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		SPEED = 100
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		SPEED = 60
		animated_sprite.flip_h = false
	
	position.x += direction * SPEED * delta
	
func _on_area_2d_2_body_entered(body):
	if body.is_in_group("Player"):  # Verificamos si el cuerpo que entra es el jugador
		print("¡El bicho te dañó!")
		
		body.take_damage(1)  # Llama a la función de daño del jugador
