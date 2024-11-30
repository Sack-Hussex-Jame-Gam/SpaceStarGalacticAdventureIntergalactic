extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
#	Change the frame 20 times a second
	if frame < 7:
		frame += 1
	else:
		frame = 0
	pass
	
	
	
