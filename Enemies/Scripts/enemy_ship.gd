extends Node3D

@export var explosion : PackedScene =preload("res://Game/Effects/explosion_anim.tscn")
var player_pos : Vector3
var dt= 0
var direction_x : float
var direction_y : float
func explode():
	var explosion_instance = explosion.instantiate()

	get_tree().root.add_child(explosion_instance)
	explosion_instance.global_position = global_position
	explosion_instance.move += Vector3.FORWARD * dt
	queue_free()


var direction : Vector3
func _ready() -> void:
	$craft.scale = Vector3.ONE * 0.1
func scale_based_on_distance(delta : float):
	player_pos = PlayerManager.player_pos
	var distance = global_position.distance_squared_to(player_pos)
	distance = (distance)
	var min_distance =5
	var max_distance = 2
	var distance_percent = inverse_lerp(max_distance,min_distance,distance)
	var min_scale = 0.1
	var max_scale = 1.0
	$craft.scale.x = lerp(min_scale,max_scale,distance_percent * delta * 0.1)
	$craft.scale.y = lerp(min_scale,max_scale,distance_percent * delta * 0.1)
	$craft.scale.z = lerp(min_scale,max_scale,distance_percent * delta * 0.1)
func steer_target(delta: float):
	dt = delta
	direction = position.direction_to(player_pos)
	var dot_z = direction.dot(transform.basis.z)
	
	var can_chase = dot_z < 0.0 && global_position.distance_to(player_pos) > 1
	
	if(can_chase):
		
		
		
		look_at(player_pos)
	else:
		look_at(Vector3.UP)
		
	
		

		
		
			
		
func _physics_process(delta: float) -> void:
	steer_target(delta)

	scale_based_on_distance(delta)
	rotate(transform.basis.x,direction.x)

	var speed =3
	global_position += -transform.basis.z *delta * speed
	
	
	transform = transform.orthonormalized()



func _on_destroy_self_timeout() -> void:
	queue_free()
