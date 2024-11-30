extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# On spacebar pressed will play the animation
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		$AnimationPlayer.play("knock_down")
		print("Animation played")

		# Wait for the animation to finish
		await $AnimationPlayer.animation_finished
		print("Animation finished")

		# Play the animation in reverse
		$AnimationPlayer.play_backwards("knock_down")
		print("Animation played in reverse")
