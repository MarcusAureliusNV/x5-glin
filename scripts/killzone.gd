extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	print("¡Colisión con la killzone detectada!")
	
	# Verificamos si el cuerpo es el jugador antes de quitar vida
	if body.name == "Player":
		body.take_damage(1)  # Llamamos a la función 'take_damage' para restar vida al jugador
	timer.start()
	
func _on_timer_timeout():
	
	get_tree().reload_current_scene()
