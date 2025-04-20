extends Area2D

@onready var animation_player = $animChest
@onready var sound = $PickupSound
@onready var yo = $"../../Yo/AnimationPlayer"

func _on_body_entered(body):
	print("AAAAAAAAAAAA")
	animation_player.play("opening")
	yo.play("a_ver")
func _on_anim_chest_animation_finished():
	print("ha terminado")
	queue_free()
