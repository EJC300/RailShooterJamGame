extends Node3D
@onready var planet_art = $Planet
@onready var planet_side : PackedScene = preload("res://Level/Scenes/planet_side.tscn")
var can_scale : bool
var start = Vector3.ONE * 0.01
@export var max_scale : float
func scale_visual_down(delta : float):

	if can_scale:
		var end =Vector3.ONE * 1000
		var total_scale = planet_art.scale.move_toward(end, delta)
		print(total_scale.length())
		planet_art.scale = total_scale
		can_scale = false

func _process(delta: float) -> void:
	scale_visual_down(delta)
	if planet_art.scale.length() > max_scale:
		get_tree().change_scene_to_packed(planet_side)
	
func _on_planet_scaler_timeout() -> void:
	can_scale = true
