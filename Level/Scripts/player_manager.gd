extends Node
var player_camera : Camera3D
var player_pos : Vector3
func set_player_camera(camera : Camera3D):
	player_camera = camera
func get_player_camera():
	return player_camera
func shake_camera():
	
	player_camera.position.x = sin(randf()) * 10
	player_camera.position.y = sin(randf()) * 10
func mouse_position():
	var pointer = player_camera.project_position( player_camera.get_viewport().get_mouse_position(),1.0)
	
	return pointer
