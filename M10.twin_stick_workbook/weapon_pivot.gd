extends Node2D

func _process(delta: float) -> void:
	var direction := global_position.direction_to(get_global_mouse_position())
	rotation = direction.angle()
