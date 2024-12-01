extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _process(delta):
	scroll_offset.x += 1000 * delta
