extends CharacterBody3D
@export var speed : float
@export var look_speed : float
@export var camera : Camera3D 
var pointer: Vector3

func _ready() -> void:
	PlayerManager.set_player_camera(camera)

signal damage(amount : float)
func  damage_apply(amount : float):
	damage.emit(amount)
func move_and_look_player(dt : float):
	velocity =	position.lerp((pointer - position),speed * dt)
	velocity.z = 0
	var screen_pos = PlayerManager.get_player_camera().project_position(PlayerManager.get_player_camera().get_viewport().get_window().size,1.0)
	position.x = clampf(position.x,-screen_pos.x * 0.5,screen_pos.x * 0.5)
	var angle_x = clamp(pointer.x - position.x,-45,45)
	
	var target_angle_x = lerp_angle(rotation.z,angle_x,dt * 850)
	
	var angle_y = clamp(pointer.y - position.y,-45,45)
	
	var target_angle_y = lerp_angle(rotation.z,angle_y,dt * 800)
	
	rotation_degrees = Vector3(target_angle_y,rotation.y, -target_angle_x)

	position.y = clampf(position.y,screen_pos.y * 0.5,-screen_pos.y * 0.5)
	
	move_and_slide()

func _physics_process(delta: float) -> void:
	PlayerManager.player_pos = self.global_position
	pointer = PlayerManager.mouse_position()
	move_and_look_player(delta)
