extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer

# Al detectar que el jugador tocó la moneda
func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("¡Jugador ha tocado la moneda!")
		# Aumentar puntos
		game_manager.add_point()
		queue_free()
