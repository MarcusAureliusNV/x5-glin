extends Control

@onready var fade_out = $Black/AnimationPlayer
@onready var music_fade = $AudioStreamPlayer/AnimationPlayer
func _on_play_pressed():
	fade_out.play("fade_out")
	music_fade.play("music_fade")
	await fade_out.animation_finished
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")

func _on_options_pressed():
	fade_out.play("fade_out")
	music_fade.play("music_fade")
	await fade_out.animation_finished


func _on_quit_pressed():
	fade_out.play("fade_out")
	music_fade.play("music_fade")
	await fade_out.animation_finished


func _on_tutorial_pressed():
	fade_out.play("fade_out")
	music_fade.play("music_fade")
	await fade_out.animation_finished
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
