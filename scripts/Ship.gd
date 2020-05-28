extends Area2D



func _ready() -> void:
	set_process(true)
	
func _process(delta: float) -> void:
	var position = get_position()
	position.x = get_global_mouse_position().x
	set_position(position)

