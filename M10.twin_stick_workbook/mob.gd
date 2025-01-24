class_name Mob extends CharacterBody2D

var _player : Player
@onready var _player_range: Area2D = $PlayerRange
@export var max_speed := 666.0
@export var acceleration := 1212.0

func _physics_process(delta: float) -> void:
	if _player == null:
		return
	var direction := global_position.direction_to(_player.global_position)
	var distance := global_position.distance_to(_player.global_position)
	var speed := max_speed if distance > 100 else max_speed * distance / 100
	
	var desired_velocity := direction * speed
	velocity = velocity.move_toward(desired_velocity, acceleration * delta)
	move_and_slide()
	
func _ready() -> void:
	_player_range.body_entered.connect(func (body: Node) -> void:
		if body is Player:
			_player = body
	)
	_player_range.body_exited.connect(func (body: Node) -> void:
		if body is Player:
			_player = null
	)
