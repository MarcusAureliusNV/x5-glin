extends Control

@onready var timer = $Timer
@onready var fade_out = $Black/AnimationPlayer
@onready var music_fade = $AudioStreamPlayer/AnimationPlayer

func _on_timer_timeout():
	fade_out.play("fade_out")
	music_fade.play("music_fade")
	await fade_out.animation_finished
	get_tree().change_scene_to_file("res://scenes/game.tscn")
