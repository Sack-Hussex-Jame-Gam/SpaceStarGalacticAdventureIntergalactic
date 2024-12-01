extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
var timePassed = 0
func _process(delta: float) -> void:
	timePassed += delta
	if timePassed >  3:
		$Button.show()
