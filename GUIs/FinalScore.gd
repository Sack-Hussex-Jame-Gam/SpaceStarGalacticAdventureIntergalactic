extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setNextScene(scene: String) -> void:
	$CenterContainer/VBoxContainer/Button.setNextScene(scene)

func setFinalScore(score: int) -> void:
	$CenterContainer/VBoxContainer/RichTextLabel.text = "Final Score: " + str(score)
	
