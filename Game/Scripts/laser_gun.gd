extends Node3D
@export var rounds_per_minute : float
@onready var fire_timer = $FireCoolDown
@onready var laser_bolt = preload("res://Player/Scenes/player_laser.tscn")
var can_fire : bool
var fire_rate : float

func _ready() -> void:
	fire_rate = 3600/(rounds_per_minute * 60)
	$FireCoolDown.wait_time = fire_rate
func fire_laser():
	if can_fire:
		can_fire = false
		var instance = laser_bolt.instantiate()
		instance.position = $Marker3D.global_position
		instance.rotation = get_parent(). rotation
		get_tree().root.add_child(instance)
		


func _on_fire_cool_down_timeout() -> void:
	can_fire = true


func _on_player_laser_gun_fire() -> void:
	fire_laser()
