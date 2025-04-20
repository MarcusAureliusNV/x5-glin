extends Control

@onready var timer = $Black/Timer
@onready var fade_out = $Black/AnimationPlayer

func _on_menu_pressed():
	fade_out.play("fade_out")
	await fade_out.animation_finished
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_retry_1_pressed():
	fade_out.play("fade_out")
	await fade_out.animation_finished
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	
func _on_retry_2_pressed():
	fade_out.play("fade_out")
	await fade_out.animation_finished
	get_tree().change_scene_to_file("res://scenes/game2.tscn")
