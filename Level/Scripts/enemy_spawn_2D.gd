extends Path3D
@onready var spawn_position = $PathSpawnPosition.global_position
@onready var spawn_follower = $PathSpawnPosition
@export var enemy_to_spawm : PackedScene = preload("res://Enemies/Scenes/EnemyShip.tscn")
var change_pos : bool
var random_pos : float
var change_time  = 0.5
#spawner
func  _process(_delta: float) -> void:
	if(change_pos):
		change_time = randf_range(1.0,3.0)
		change_pos = false
		random_pos = randf_range(0.0,curve.point_count)
		
		var enemy = enemy_to_spawm.instantiate()
		spawn_follower.progress_ratio = random_pos
	
		
		get_tree().root.add_child(enemy)
		enemy.global_position = spawn_follower.global_position
		$Change.wait_time = change_time

func _on_change_timeout() -> void:
	change_pos = true
