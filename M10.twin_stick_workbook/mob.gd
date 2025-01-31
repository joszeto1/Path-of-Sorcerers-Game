class_name Mob extends CharacterBody2D

@export var max_speed := 200.0
@export var acceleration := 800.0
@export var health := 5: set = set_health
@export var damage := 1

var _player : Player = null

@onready var player_range: Area2D = %PlayerRange
@onready var hitbox: Area2D = %Hitbox

func die():
	queue_free()

func set_health(new_health: int):
	health = new_health
	if health <= 0:
		die()

func _physics_process(delta: float) -> void:
	if _player == null:
		velocity = velocity.move_toward(Vector2.ZERO, acceleration * delta)
	else:
		var direction := global_position.direction_to(_player.global_position)
		var distance := global_position.distance_to(_player.global_position)
		var speed := max_speed if distance > 100 else max_speed * distance / 100
		var desired_velocity := direction * speed
		velocity = velocity.move_toward(desired_velocity, acceleration * delta)
	move_and_slide()
	
func _ready() -> void:
	player_range.body_entered.connect(func (body: Node) -> void:
		if body is Player:
			_player = body
	)
	player_range.body_exited.connect(func (body: Node) -> void:
		if body is Player:
			_player = null
	)
	hitbox.body_entered.connect(func (body: Node) -> void:
		if body is Player:
			body.health -= damage
	)
