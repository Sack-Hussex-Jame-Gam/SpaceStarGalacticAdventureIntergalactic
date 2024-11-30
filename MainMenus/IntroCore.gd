extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
var timePassed = 0
func _process(delta: float) -> void:
	timePassed += delta
	if timePassed >  3:
		$AnimatedSprite2D.show()

	if timePassed >  5:
		# Change scene to Level 4
		get_tree().change_scene_to_file("res://Level1/level1.tscn")
