extends Area2D

@export var speed := 1000.0
var _distance_traveled := 0.0
var max_range := 10.0

func _physics_process(delta: float) -> void:
	var trajectory := delta * speed
	var direction := Vector2.RIGHT.rotated(rotation) * trajectory
	
	position += direction
	
	_distance_traveled += trajectory * delta
	
	if _distance_traveled >= max_range:
		_destroy()




func _destroy():
	queue_free()
