extends CharacterBody3D
@export var speed : float
@export var look_speed : float
@export var camera : Camera3D 
var pointer: Vector3

func _ready() -> void:
	PlayerManager.set_player_camera(camera)
	

func move_player(dt : float):
	velocity =	position.lerp((pointer - position),speed * dt)
	velocity.z = 0
	var screen_pos = PlayerManager.get_player_camera().project_position(PlayerManager.get_player_camera().get_viewport().get_window().size,1.0)
	position.x = clampf(position.x,-screen_pos.x * 0.5,screen_pos.x * 0.5)

	position.y = clampf(position.y,screen_pos.y * 0.5,-screen_pos.y * 0.5)
	print(-screen_pos.y)
	move_and_slide()

func _physics_process(delta: float) -> void:
	pointer = PlayerManager.mouse_position()
	move_player(delta)
