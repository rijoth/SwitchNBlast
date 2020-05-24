extends Node

var curr_score

func _ready() -> void:
	curr_score = 0
	
func getScore(var score):
	curr_score = score
	curr_score = scoreCounter(curr_score)

func scoreCounter(var score):
	curr_score = score + 1
	return curr_score
	
func displayScore():
	var score = curr_score
	return score
