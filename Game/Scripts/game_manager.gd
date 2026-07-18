extends Node
@export var start_scale : float
@export var max_scale : float
@onready var distance_timer : Timer = $DistanceTimer

#var scale = 0
#var traverse = false
#func  _process(delta: float) -> void:
#	if scale > max_scale:
#		pass
#func scale_by_distance():
#	if traverse:
		
#		return traverse
#	else:
#		return false



#func _on_distance_timer_timeout() -> void:
#	traverse = !traverse
#	scale += 0.01
