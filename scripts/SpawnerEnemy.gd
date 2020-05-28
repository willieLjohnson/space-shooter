extends Node

const ENEMY_SIZE = 16

const enemy_kamikaze_scene = preload("res://scenes/EnemyKamikaze.tscn")

func _ready() -> void:
	spawn()
	
func spawn() -> void:
	randomize()
	var enemy = enemy_kamikaze_scene.instance()
	var position = Vector2()
	position.x = rand_range(0 + ENEMY_SIZE, Utils.view_size.x - ENEMY_SIZE)
	position.y = 0 - ENEMY_SIZE
	enemy.set_position(position)
	get_node("Container").add_child(enemy)
