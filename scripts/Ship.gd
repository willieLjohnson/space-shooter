extends Area2D

const SHIP_WIDTH = 16


func _ready() -> void:
	set_process(true)
	
func _process(delta: float) -> void:
	var motion = (Utils.mouse_position.x - get_position().x) * 0.2
	translate(Vector2(motion, 0))
	set_position(position)
	
	var position = get_position()
	position.x = clamp(position.x, 0 + SHIP_WIDTH, Utils.view_size.x - SHIP_WIDTH)
	set_position(position)

 
