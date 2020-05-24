extends Node2D
var enemyList = ['red', 'blue', 'green']

var timer = Timer.new()
var canSpawn = true

func _ready() -> void:
	timer.set_wait_time(2)
	timer.set_one_shot(true)
	timer.connect("timeout", self, "_on_Timer_timeout")
	add_child(timer)
	

func _physics_process(delta: float) -> void:
	if canSpawn == true:
		enemySpawn()
		canSpawn = false

func enemySpawn():
	timer.start()
	
	randomize()
	var currentEnemySprite = enemyList[randi() % enemyList.size()] 
	
	var enemies = load("res://src/objects/others/Enemies.tscn")
	var enemy = enemies.instance()
	enemy.get_node("AnimatedSprite").animation = currentEnemySprite
	add_child_below_node(get_tree().get_root().get_node("GameScene"), enemy)

func _on_Timer_timeout():
	canSpawn = true
