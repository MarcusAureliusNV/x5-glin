extends Node

var score = 0
var max_score: int = 9

@onready var score_label = $ScoreLabel

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
