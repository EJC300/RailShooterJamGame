extends Node
var player_camera : Camera3D
var player_pos : Vector3
var dt : float
var can_shake : bool
var shake : bool
func shake_camera():
	if !can_shake :
		can_shake = true
		$ShakeTimer.start(0.2)
	
	
func set_player_camera(camera : Camera3D):
	player_camera = camera
func get_player_camera():
	return player_camera
func mouse_position():
	var pointer = player_camera.project_position( player_camera.get_viewport().get_mouse_position(),1.0)

	return pointer
func  _process(delta: float) -> void:
	dt = delta
	if (can_shake):
		
		player_camera.global_position.x = sin(randf() * dt) * 10
		player_camera.global_position.y = sin(randf() * dt) * 10
	if(Input.is_action_pressed("Exit Game")):
		get_tree().quit()
		
		


func _on_shake_timer_timeout() -> void:
	can_shake = false
	$ShakeTimer.stop()
