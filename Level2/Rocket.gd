extends AnimatedSprite3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@export var frames = 10
@export var speed = 10

var cooldown = speed
var moved = false

func _process(delta: float) -> void:
#	Change the frame 20 times a second
	# Get quanity of frames from the animation
	if frame < frames -1:
		if cooldown == 10:
			frame += 1
			cooldown = speed
		else:
			cooldown += 1

	else:
		if cooldown == 10:
			frame = 0
			cooldown = speed
		else:
			cooldown += 1

	# Fly towards 0,0,0
	if position.x < 0 and not moved:
		position.x += 1 * delta

	if position.y > 0 and not moved:
		moved = true
