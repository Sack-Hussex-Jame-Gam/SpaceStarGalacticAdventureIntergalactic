extends Button

var nextScene = ""

func setNextScene(scene: String) -> void:
	nextScene = scene

func _ready() -> void:
	pressed.connect(self._button_pressed)
	
func _button_pressed():
	get_tree().change_scene_to_file(nextScene)
