extends Node3D

@export var levelLengthSeconds = 30
@export var nextScene = "res://Level4/Level4.tscn"
var timePassed = 0

func setLevelLengthSeconds(seconds: int) -> void:
	levelLengthSeconds = seconds

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	timePassed += delta
	if timePassed > levelLengthSeconds:
		showFinalScore()

func showFinalScore():
	# Enable end screen
	$FinalScore.setNextScene(nextScene)
	$FinalScore.show()
