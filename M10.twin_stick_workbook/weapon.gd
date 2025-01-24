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
	#bullet.rotation = randf_range(-angle/2.0, angle/2.0)
	#modified the above line and put below so you could see both
	
	#Adjust rotation based on weapon's direction and random spread
	var direction = sign(global_scale.x) #positive if facing right, negative if facing left
	var random_angle = randf_range(-angle / 2.0, angle /2.0)
	bullet.rotation = global_rotation + random_angle * direction
