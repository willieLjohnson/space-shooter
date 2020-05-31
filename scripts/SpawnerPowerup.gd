extends Node

const POWERUP_SIZE = 7

const POWERUPS = [
	preload("res://scenes/PowerupArmor.tscn"),
	preload("res://scenes/PowerupLaser.tscn")
]

func _ready() -> void:
	yield(Utils.create_timer(rand_range(10, 15)), "timeout")
	spawn()
	
func spawn() -> void:
	while true:
		randomize()
		
		var powerup = Utils.choose(POWERUPS).instance()
		var position = Vector2()
		position.x = rand_range(0 + POWERUP_SIZE, Utils.view_size.x - POWERUP_SIZE)
		position.y = 0 - POWERUP_SIZE
		powerup.set_position(position)
		get_node("Container").add_child(powerup)
		yield(Utils.create_timer(rand_range(10, 15)), "timeout")
