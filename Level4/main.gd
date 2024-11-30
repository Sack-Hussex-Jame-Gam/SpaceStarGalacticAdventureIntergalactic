extends Node3D

var cameraEvents = [[1,2],[2,4],[3,2],[1,2],[3,5],[1,1],[2,2]]
var runtime = 0

func run_camera():

	print("Running camera")
	for event in cameraEvents:
		print("Going to camera: ", event[0], " for ", event[1], " seconds")
		$Camera1.set_current(false)
		$Camera2.set_current(false)
		$Camera3.set_current(false)
		match event[0]:
			1:
				$Camera1.set_current(true)
			2:
				$Camera2.set_current(true)
			3:
				$Camera3.set_current(true)

		await get_tree().create_timer(event[1]).timeout

	print("Camera run finished")


	# Based on a present movement of
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for event in cameraEvents:
		runtime += event[1]
	print("Runtime: ", runtime)
	run_camera()


# Called every frame. 'delta' is the elapsed time since the previous frame.
var timeRunning = 0
func _process(delta: float) -> void:
	timeRunning += delta
	$Control/ProgressBar.value = timeRunning / runtime *100
	
	if timeRunning > runtime:
		$FinalScore.show()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_left"):
		$Camera1.set_current(true)
		$Camera2.set_current(false)
		$Camera3.set_current(false)
	if event.is_action_pressed("ui_right"):
		$Camera1.set_current(false)
		$Camera2.set_current(true)
		$Camera3.set_current(false)
	if event.is_action_pressed("ui_down"):
		$Camera1.set_current(false)
		$Camera2.set_current(false)
		$Camera3.set_current(true)
