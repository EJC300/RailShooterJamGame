extends Area3D
@export var speed : float

func _process(delta: float) -> void:
	var forward_speed = Vector3.FORWARD * speed
	position += forward_speed * delta
	

func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("Enemy"):
		#area.explode()
		queue_free()


func _on_destroy_timer_timeout() -> void:
	queue_free()
