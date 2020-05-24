extends KinematicBody2D
var velocity = Vector2()

func _ready() -> void:
	velocity.y = 100
	
func _physics_process(delta: float) -> void:
	move_and_slide(velocity)


func _on_DestructArea_area_entered(area: Area2D) -> void:
	if area.name == 'BltColArea':
		queue_free()
		area.queue_free()
		


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
