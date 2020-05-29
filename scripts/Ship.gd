extends Area2D

const SHIP_WIDTH = 16
const LASER_SCENE = preload("res://scenes/LaserShip.tscn")

var armor = 4

func _ready() -> void:
	set_process(true)
	add_to_group("ship")
	
	yield(Utils.create_timer(0.5), "timeout")
	shoot()
	
func _process(delta: float) -> void:
	var motion = (Utils.mouse_position.x - get_position().x) * 0.2
	translate(Vector2(motion, 0))
	set_position(position)
	
	var position = get_position()
	position.x = clamp(position.x, 0 + SHIP_WIDTH, Utils.view_size.x - SHIP_WIDTH)
	set_position(position)

func shoot():
	while true: 
		var position_left = $Cannons/Left.get_global_position()
		var position_right = $Cannons/Right.get_global_position()
		create_laser(position_left)
		create_laser(position_right)
		
		yield(Utils.create_timer(0.25), "timeout")
	
func set_armor(new_value: int) -> void:
	armor = new_value
	if armor <= 0: queue_free()

func create_laser(position: Vector2) -> void:
	var laser = LASER_SCENE.instance()
	laser.set_position(position)
	Utils.main_node.add_child(laser)
	
