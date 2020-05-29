extends Node

const ENEMY_SIZE = 16

const enemies = [
	preload("res://scenes/EnemyKamikaze.tscn"),
	preload("res://scenes/EnemyClever.tscn")
]

func _ready() -> void:
	spawn()
	
func spawn() -> void:
	while true:
		randomize()
		
		var enemy = Utils.choose(enemies).instance()
		var position = Vector2()
		position.x = rand_range(0 + ENEMY_SIZE, Utils.view_size.x - ENEMY_SIZE)
		position.y = 0 - ENEMY_SIZE
		enemy.set_position(position)
		get_node("Container").add_child(enemy)
		yield(Utils.create_timer(rand_range(0.5, 1.25)), "timeout")
