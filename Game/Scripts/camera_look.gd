extends Node3D
@export var world_camera : Camera3D

func _process(_delta: float) -> void:
	var pointer = world_camera.project_position(PlayerManager.get_player_camera().get_viewport().get_mouse_position(),1.0)
	var screen_pos = PlayerManager.get_player_camera().project_position(PlayerManager.get_player_camera().get_viewport().get_window().size,1.0)
	pointer.x = clampf(pointer.x,-screen_pos.x * 0.3,screen_pos.x * 0.3)

	pointer.y = clampf(pointer.y,screen_pos.y * 0.3,-screen_pos.y * 0.3)
	look_at(pointer,Vector3.UP) 
