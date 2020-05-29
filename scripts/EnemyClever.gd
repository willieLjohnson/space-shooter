extends "res://scripts/Enemy.gd"

const laser_scene = preload("res://scenes/LaserEnemy.tscn")

func _ready() -> void:
	velocity.x = Utils.choose([velocity.x, -velocity.x])
	
	yield(Utils.create_timer(1), "timeout")
	shoot()

func _process(delta) -> void:
	if get_position().x <= 0 + SIZE:
		velocity.x = abs(velocity.x)
	if get_position().x >= Utils.view_size.x - SIZE:
		velocity.x = -abs(velocity.x)

func shoot():
	while true:
		var laser = laser_scene.instance()
		laser.set_position($Cannon.get_global_position())
		Utils.main_node.add_child(laser)
		yield(Utils.create_timer(1.5), "timeout")
