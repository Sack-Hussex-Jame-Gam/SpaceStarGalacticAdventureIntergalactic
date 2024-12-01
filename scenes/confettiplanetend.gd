extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@export var frames = 10
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
#	Change the frame 20 times a second
	# Get quanity of frames from the animation
	if frame < frames -1:
		frame += 1
	else:
		frame = 0
	pass

	# If distance to parent.Player is less than 100, show()
	if position.distance_to(get_parent().get_node("Player").position) < 100:
		show()
	else:
		hide()
	
