extends Node3D
@export var health : float
@export var explosion : PackedScene =preload("res://Enemies/Scenes/explosion.tscn")
var dt : float

func explode():
	if health < 0.0:	
		var explosion_instance = explosion.instantiate()

		get_tree().root.add_child(explosion_instance)
		explosion_instance.global_position = global_position
		explosion_instance.move += Vector3.FORWARD * dt
		queue_free()
func _on_player_damage(amount: float) -> void:
	print("boom")
	health -= amount
	PlayerManager.shake_camera()
	explode()
func  _process(delta: float) -> void:
	dt = delta
