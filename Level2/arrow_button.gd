extends Control

@export var keytype = 0

var enabled = false

func changeTexture(givenkeytype: int) -> void:
	var TextRect = TextureRect.new()
	add_child(TextRect)
	# 0.7 scale
	TextRect.scale = Vector2(0.8, 0.8)
	TextRect.texture = load("res://Level2/Assets/Keys/key" + str(givenkeytype) + ".png")
	
func _ready() -> void:
	changeTexture(keytype)
	
