extends Area2D

var currBlt = "red"
var timer = Timer.new()
var canShoot = true
signal Bullet

#touchscreen controls
var buttonRotatePressed = false

func _ready() -> void:
	timer.set_wait_time(0.2)
	timer.set_one_shot(true)
	timer.connect("timeout", self, "_on_Timer_timeout")
	add_child(timer)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("key_x"):
		if $AnimatedSprite.animation == "anim_red":
			$AnimatedSprite.animation = "anim_blue"
			currBlt = "blue"
		elif $AnimatedSprite.animation == "anim_blue":
			$AnimatedSprite.animation = "anim_green"
			currBlt = "green"
		else:
			$AnimatedSprite.animation = "anim_red"
			currBlt = "red"
	
	if Input.is_action_pressed("key_z") and canShoot == true:
		shoot()
		emit_signal("Bullet",currBlt)
		canShoot = false

func shoot():
	timer.start()
	var Bullet = load("res://src/objects/others/Bullet.tscn")
	var Blt = Bullet.instance()
	Blt.get_node("AnimatedSprite").animation = currBlt
	add_child_below_node(get_tree().get_root().get_node("GameScene"), Blt)

func _on_Timer_timeout():
	canShoot = true


func _on_ButtonRotate_pressed() -> void:
	if $AnimatedSprite.animation == "anim_red":
		$AnimatedSprite.animation = "anim_blue"
		currBlt = "blue"
	elif $AnimatedSprite.animation == "anim_blue":
		$AnimatedSprite.animation = "anim_green"
		currBlt = "green"
	else:
		$AnimatedSprite.animation = "anim_red"
		currBlt = "red"


func _on_ButtonFire_pressed() -> void:
	if canShoot == true:
		shoot()
		emit_signal("Bullet",currBlt)
		canShoot = false
