extends Control

@onready var fade_out = $Black/AnimationPlayer
@onready var music_fade = $AudioStreamPlayer/AnimationPlayer
@onready var quit = $VBoxContainer/Quit/AnimationPlayer
func _on_play_pressed():
	fade_out.play("fade_out")
	music_fade.play("music_fade")
	await fade_out.animation_finished
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")


func _on_quit_pressed():
	music_fade.play("music_fade")
	await music_fade.animation_finished
	quit.play("quit")
	await quit.animation_finished
	get_tree().quit()


func _on_tutorial_pressed():
	fade_out.play("fade_out")
	music_fade.play("music_fade")
	await fade_out.animation_finished
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
