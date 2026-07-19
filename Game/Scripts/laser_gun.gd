extends Node3D
@export var rounds_per_minute : float
@onready var fire_timer = $FireCoolDown
@onready var laser_sound = $LaserSound
@export var laser_bolt : PackedScene
var can_fire : bool
var fire_rate : float
@export var is_enemy : bool 
func _ready() -> void:
	fire_rate = 3600/(rounds_per_minute * 60)
	$FireCoolDown.wait_time = fire_rate
func fire_laser():
	if can_fire:
		laser_sound.play()
		can_fire = false
		var instance = laser_bolt.instantiate()
		instance.position = $Marker3D.global_position
		instance.rotation = get_parent(). rotation
		get_tree().root.add_child(instance)
	else:
		laser_sound.stop()

func  _process(_delta: float) -> void:
	if is_enemy:
		fire_laser()
func _on_fire_cool_down_timeout() -> void:
	can_fire = true


func _on_player_laser_gun_fire() -> void:
	fire_laser()
