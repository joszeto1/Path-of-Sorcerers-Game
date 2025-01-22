class_name Weapon extends Node2D

@export var bullet_scene: PackedScene = preload("res://bullet.tscn")
@export var speed := 900.0
@export var max_range := 100.0
@export var angle := 0.5
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot_bullet()

func shoot_bullet():
	var bullet: Node = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)
	
	bullet.speed = speed
	bullet.max_range = max_range
	bullet.global_position = global_position
	bullet.rotation = randf_range(-angle/2.0, angle/2.0)
