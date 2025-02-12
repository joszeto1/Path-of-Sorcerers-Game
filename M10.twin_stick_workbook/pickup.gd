class_name Pickup extends Area2D

@export var item: Item = null: set = set_item
@onready var _sprite_2d: Sprite2D = %Sprite2D
@onready var _collision_shape_2d: CollisionShape2D = %CollisionShape2D
@onready var _audio_stream_player_2d: AudioStreamPlayer2D = %AudioStreamPlayer2D



func _ready() -> void:
	body_entered.connect(func (body: Node2D) -> void:
		if body is Player:
			item.use(body)
			_audio_stream_player_2d.play()
			print("Sound should play")
			_audio_stream_player_2d.finished.connect(func(): queue_free())
	)

func set_item(value: Item) -> void:
	item = value
	if _sprite_2d != null:
		_sprite_2d.texture = item.texture
	if _audio_stream_player_2d != null:
		_audio_stream_player_2d.stream = item.sfx
