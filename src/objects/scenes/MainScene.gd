extends Node2D


func _ready() -> void:
	pass


func _on_PlayButton_pressed() -> void:
	get_tree().change_scene("res://src/objects/scenes/GameScene.tscn")
