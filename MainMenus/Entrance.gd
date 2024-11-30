extends TextureRect


func _ready() -> void:
	position.y -= 500


var moved = 0
func _process(delta: float) -> void:
	if moved < 2:
		moved += delta
		position.y += 300 * delta
