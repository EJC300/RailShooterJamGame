extends Node3D

var move : Vector3

func  _process(_delta: float) -> void:
	$AnimatedSprite3D.play()
	position -= move

func _on_animated_sprite_3d_animation_finished() -> void:
	queue_free()
	


func _on_timer_timeout() -> void:
	queue_free()
