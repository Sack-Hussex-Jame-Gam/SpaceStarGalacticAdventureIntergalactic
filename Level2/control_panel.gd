extends Control

@onready var alignFins = $"../alignFins"
@onready var allPowerEngine = $"../all power engine"
@onready var startBoosters = $"../start boosters"
@onready var refuel = $"../refuel"
@onready var powerShields = $"../power shields"
@onready var morePowerBoosters =  $"../more power boosters"


var instructions = [
	"Align the fins!",
	"Start the boosters",
	"All power to the engine",
	"Align the fins",
	"Power up the shields!",
	"More power to the boosters!",
	"Refuel!",
	"All power to the engine",
	"Align the fins!",
	"Refuel!",
	"All power to the engine!",
	"More power to the boosters!",
	"Align the fins!",
	"Power up the shields!",
	"More power to the boosters!"
]

var keymappings = [
	["engine", [2,3,6,7]],
	["fins", [5,4]],
	["boosters", [4,4,5,5,3]],
	["fuel", [7,7,3,3]],
	["thruster", [2,3,6,7,6]],
	["shields", [3,3]]
]

var currentWaitingKeys = []

var instuction = 0
var instructionsCompleted = 0
var score = 10000
var totalscore = 0
func _process(delta: float) -> void:
	score -= delta * 1000
	var InstructionLabel = $ColorRect/RichTextLabel
	if instructionsCompleted < instructions.size() and currentWaitingKeys.is_empty():
		var newInstruction = instructions[instructionsCompleted]
		if instructionsCompleted == 0 or instructionsCompleted == 3 or instructionsCompleted == 8 or instructionsCompleted == 12:
			alignFins.play()
		if instructionsCompleted == 1: 
			startBoosters.play()
		if instructionsCompleted == 2 or instructionsCompleted == 7 or instructionsCompleted == 10:
			allPowerEngine.play()
		if instructionsCompleted == 4 or instructionsCompleted == 13:
			powerShields.play()
		if instructionsCompleted == 5 or  instructionsCompleted == 11:
			morePowerBoosters.play()
		if instructionsCompleted == 6  or instructionsCompleted == 9:
			refuel.play()
		print("New instruction")
		totalscore += score
		score = 10000
		InstructionLabel.text = newInstruction
		instructionsCompleted += 1

		# Search the text for words in keymappings
		for key in keymappings:
			if newInstruction.find(key[0]) != -1:
				currentWaitingKeys = key[1].duplicate()
				print("Set waiting keys to " + str(currentWaitingKeys))
				print("Found key " + str(key[0]) + " in " + newInstruction)
				break

	elif instructionsCompleted >= instructions.size():
		InstructionLabel.text = "!!!!"
		get_parent().get_node("FinalScore").show()
		get_parent().get_node("FinalScore").setNextScene("res://scenes/game.tscn")
		get_parent().get_node("FinalScore").setFinalScore(totalscore)



# Check for keys in combinations, if correct, remove from list

var unloadforce = 0

func _physics_process(delta: float) -> void:
	if currentWaitingKeys.is_empty():
		return
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	if currentWaitingKeys[0] == unloadforce:
		var validKeyCombination = false

		if unloadforce == 1:
			validKeyCombination = left and right and up and down

		elif unloadforce == 2:
			validKeyCombination = down and not up and not left and not right

		elif unloadforce == 3:
			validKeyCombination = left and right and not up and not down

		elif unloadforce == 4:
			validKeyCombination = left and not right and not up and not down

		elif unloadforce == 5:
			validKeyCombination = right and not left and not up and not down

		elif unloadforce == 6:
			validKeyCombination = up and not down and not left and not right

		elif unloadforce == 7:
			validKeyCombination = up and down and not left and not right

		if not validKeyCombination:
			unloadforce = 0
		else:
			# Same key pressed again or invalid combination, ignore
			return


	if currentWaitingKeys[0] == 1:
		if left and right and up and down:
			currentWaitingKeys.pop_front()
			unloadforce = 1

	elif currentWaitingKeys[0] == 2:
		if down and not up and not left and not right:
			currentWaitingKeys.pop_front()
			unloadforce = 2

	elif currentWaitingKeys[0] == 3:
		if left and right and not up and not down:
			currentWaitingKeys.pop_front()
			unloadforce = 3

	elif currentWaitingKeys[0] == 4:
		if left and not right and not up and not down:
			currentWaitingKeys.pop_front()
			unloadforce = 4

	elif currentWaitingKeys[0] == 5:
		if right and not left and not up and not down:
			currentWaitingKeys.pop_front()
			unloadforce = 5

	elif currentWaitingKeys[0] == 6:
		if up and not down and not left and not right:
			currentWaitingKeys.pop_front()
			unloadforce = 6

	elif currentWaitingKeys[0] == 7:
		if up and down and not left and not right:
			currentWaitingKeys.pop_front()
			unloadforce = 7
