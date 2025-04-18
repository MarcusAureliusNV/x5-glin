extends Node

var score = 0
var max_score: int = 9

var hpAct = 3


@onready var score_label = $ScoreLabel
@onready var hpC = $notifDmg
@onready var timer = $Timer # Timer es un nodo especializado de Godot.
func _ready(): # Palabra reservada que ejecuta esta función nada más cargar.
	print("score_label:", score_label)
	print("hpC:", hpC)
	rem_hp()


func add_point():
	if score < max_score:
		score += 1

		if score >= 1 and score <= 3:
			score_label.text = "Has recolectado " + str(score) + " monedas. ¡Sigue así!"
		elif score >= 4 and score <= 6:
			score_label.text = "Has recolectado " + str(score) + " monedas. ¡Vas por buen camino!"
		elif score >= 7 and score <= 8:
			score_label.text = "Has recolectado " + str(score) + " monedas. ¡Casi llegas al máximo!"
		else:
			score_label.text = "¡Felicidades! ¡Has cogido todas las monediwis!"

func rem_hp():
	if hpAct == 3:
		hpC.text = "Tienes toda la salud (3 golpes)."
	elif hpAct == 2:
		hpC.text = "¡Te han bajado a 2 golpes!"
	elif hpAct == 1:
		hpC.text = "Estás a un golpe. Reza por tu alma."
	else:
		timer.start()
		hpC.text = "Vaya... moriste. Reiniciando juego en 5 segundos..."
		

func _on_timer_timeout():
	get_tree().reload_current_scene()  # Reiniciamos la escena cuando el timer se agote
