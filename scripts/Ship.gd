extends Area2D

const SHIP_WIDTH = 16
const LASER_SCENE = preload("res://scenes/LaserShip.tscn")
const EXPLOSION_SCENE = preload("res://scenes/Explosion.tscn")
const FLASH_SCENE = preload("res://scenes/Flash.tscn")

var armor = 4 setget set_armor
var is_double_shooting = false setget set_double_shooting

signal armor_changed

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
		
		if is_double_shooting:
			var laser_left = create_laser(position_left)
			var laser_right = create_laser(position_right)
			laser_left.velocity.x = -25
			laser_right.velocity.x = 25
			
		yield(Utils.create_timer(0.25), "timeout")
	
func set_armor(new_value: int) -> void:
	if new_value > 4: return
		
	if new_value < armor:
		AudioPlayer.play2D("hit_ship", self)
		Utils.main_node.add_child(FLASH_SCENE.instance())
		
	armor = new_value
	emit_signal("armor_changed", armor)
	if armor <= 0: 
		create_explosion()
		queue_free()

func set_double_shooting(new_value: bool) -> void:
	is_double_shooting = new_value
	
	if is_double_shooting:
		yield(Utils.create_timer(5), "timeout")
		is_double_shooting = false
	
func create_laser(position: Vector2) -> Node2D:
	var laser = LASER_SCENE.instance()
	laser.set_position(position)
	Utils.main_node.add_child(laser)
	return laser

func create_explosion():
	var explosion = EXPLOSION_SCENE.instance()
	explosion.set_position(get_position())
	Utils.main_node.add_child(explosion)
