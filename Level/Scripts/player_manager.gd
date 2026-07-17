extends Node
var player_camera : Camera3D

func set_player_camera(camera : Camera3D):
	player_camera = camera
func get_player_camera():
	return player_camera
func mouse_position():
	var pointer =  player_camera.project_position( player_camera.get_viewport().get_mouse_position(),1.0)

	return pointer
