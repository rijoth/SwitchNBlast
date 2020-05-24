extends Node2D


func _ready() -> void:
	var HScore = GameManager.get_score()
	$Control/HighScore.text = "High Score:"+ " " + str(HScore) 
	$Control/CurrScore.text = "Current Score:"+ " " + str(GlobalScoreCalc.position.x) 




func _on_BtnPlay_pressed() -> void:
	GlobalScoreCalc.position.x = 0 
	GlobalScoreCalc.position.y = 3 
	get_tree().change_scene("res://src/objects/scenes/GameScene.tscn")


func _on_BtnMainMenu_pressed() -> void:
	get_tree().change_scene("res://src/objects/scenes/MainScene.tscn")
