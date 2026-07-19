extends Area3D
@export var speed : float
func _process(delta: float) -> void:
	var forward_speed =-transform.basis.z * speed
	position += forward_speed * delta
	

func _on_area_entered(area: Area3D) -> void:
	print(area.get_parent().get_groups()[0])
	if area.get_parent().is_in_group("enemy"):
		print("destroy")
		area.get_parent().explode()
	elif area.get_parent().is_in_group("player"):
		print("destroy1")
		area.get_parent().damage_apply(10)


func _on_destroy_timer_timeout() -> void:
	queue_free()
