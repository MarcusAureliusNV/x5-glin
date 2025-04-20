extends Control

@onready var timer = $Black/Timer
@onready var fade_out = $Black/AnimationPlayer
@onready var music_fade = $AudioStreamPlayer/AnimationPlayer

func _on_praderas_pressed():
	fade_out.play("fade_out")
	music_fade.play("music_fade")
	await fade_out.animation_finished
	get_tree().change_scene_to_file("res://scenes/loading_level.tscn")


func _on_mazmorras_pressed():
	fade_out.play("fade_out")
	music_fade.play("music_fade")
	await fade_out.animation_finished
	get_tree().change_scene_to_file("res://scenes/loading_level2.tscn")
