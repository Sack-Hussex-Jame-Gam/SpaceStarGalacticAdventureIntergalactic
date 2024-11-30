extends PathFollow3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Increase the PathFollow3D percent over 10 seconds
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Ohysics func _process(delta):
func _physics_process(delta):
	# Move the camera along the path
	# This is the pathfollow node
	set_progress_ratio(get_progress_ratio() + 0.1 * delta)
