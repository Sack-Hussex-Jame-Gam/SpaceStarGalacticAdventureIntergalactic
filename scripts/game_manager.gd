extends Node


@onready var score_label = $"../labels/scoreLabel"

var score = 0
func add_point():
	score+=1
	score_label.text = "You have earned "+str(score)+" coins."
	print(score_label)
