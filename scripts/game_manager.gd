extends Node

var score = 0
var max_score: int = 9

var hpAct = 5
var lives = 3


@onready var score_label = $ScoreLabel
@onready var hpC = $notifDmg
@onready var timer = $Timer 
@onready var fade_windeath = $Timer/Black2/AnimationPlayer
func _ready(): # Palabra reservada que ejecuta esta función nada más cargar.
	print("score_label:", score_label)
	print("hpC:", hpC)
	rem_hp()


func add_point():
	if score < max_score:
		score += 1

		if score == 1:
			score_label.text = "Has recolectado " + str(score) + " moneda. ¡Del primer céntimo sale el primer millón!"
		elif score == 2:
			score_label.text = "Has recolectado " + str(score) + " monedas. Ya te da para un chicle."
		elif score == 3:
			score_label.text = "Has recolectado " + str(score) + " monedas. ¡Sólo te queda un 66.66% periódico!"
		elif score == 4:
			score_label.text = "Has recolectado " + str(score) + " monedas. En Japón este número suele asociarse con la muerte."
		elif score == 5:
			score_label.text = "4+1."
		elif score == 6:
			score_label.text = "Has recolectado " + str(score) + " monedas. Un 9 australiano."
		elif score == 7:
			score_label.text = "Has recolectado " + str(score) + " monedas. ¡777!"
		elif score == 8:
			score_label.text = "Has recolectado " + str(score) + " monedas. Infinitamente verticalizado."
		elif score == 9:
			score_label.text = "Has recolectado " + str(score) + " monedas. ¡Olé tú! ¡Todas las monedas recogidas!"
			fade_windeath.play("fade_out")
			await fade_windeath.animation_finished
			get_tree().change_scene_to_file("res://scenes/win.tscn")

func rem_hp():
	if hpAct == 5:
		hpC.text = "Tienes toda la salud (5 golpes)."
	elif hpAct == 4:
		hpC.text = "4. No te preocupes por uno."
	elif hpAct == 3:
		hpC.text = "3 golpes y estas K.O."
	elif hpAct == 2:
		hpC.text = "¡Te han bajado a 2 golpes!"
	elif hpAct == 1:
		hpC.text = "Estás a un golpe. Reza por tu alma."
	else:
		timer.start()
		hpC.text = ". . ."
		fade_windeath.play("fade_out")
		await fade_windeath.animation_finished

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/death.tscn")
