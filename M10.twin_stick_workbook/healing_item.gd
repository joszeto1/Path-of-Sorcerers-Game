class_name HealingItem extends Item

@export var heal_amount := 1

func use(player: Player) -> void:
	player.health += heal_amount
