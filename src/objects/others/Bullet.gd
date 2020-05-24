extends KinematicBody2D

var isCollided = false
var bltSpr


var velocity = Vector2()
func _ready() -> void:
	velocity.y = -600
	
func _physics_process(delta: float) -> void:
	bltSpr = $AnimatedSprite.animation
	move_and_slide(velocity)
	if isCollided == true:
		queue_free()
		isCollided = false
	


func _on_BltColArea_body_entered(body: Node) -> void:
	var enSpr = body.get_node("AnimatedSprite").animation
	isCollided = true
	$AnimatedSprite.visible = false
	if bltSpr == enSpr:
		
		#this is used as score
		GlobalScoreCalc.position.x += 1
		queue_free()
		body.queue_free()
	else:
		# this is used as health
		GlobalScoreCalc.position.y -= 1


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
	print("deleted")
