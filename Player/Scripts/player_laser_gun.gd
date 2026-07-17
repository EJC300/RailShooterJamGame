extends Node3D
signal fire()


func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("ShootLaser")):
		fire.emit()
