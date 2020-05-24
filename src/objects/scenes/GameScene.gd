extends Node2D

var isPaused = false

func _ready() -> void:
	get_tree().paused = false  
	#setting score and lifes
	GlobalScoreCalc.position.x = 0 #This is considered as health
	GlobalScoreCalc.position.y = 3 #This is considered as life                               
	pass
	
func _process(delta: float) -> void:
	var score = GlobalScoreCalc.position.x
	var life  = GlobalScoreCalc.position.y
	$UI/LblScore.text = "Score: " + str(score)
	$UI/LblLife.text = "Life: " + str(life)
	
	if life <= 0:
		var HScore = GameManager.get_score()
		if score > HScore:
			GameManager.set_score(score)
		get_tree().change_scene("res://src/objects/scenes/GameOverScene.tscn")
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("key_pause"):
		get_tree().paused = false


