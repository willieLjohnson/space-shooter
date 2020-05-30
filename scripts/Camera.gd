extends Camera2D

var magnitude = 0
var time_left = 0
var is_shaking = false
func _ready() -> void:
	pass
	
func shake(new_magnitude, life_time) -> void:
	if magnitude > new_magnitude: return
	
	magnitude = new_magnitude
	time_left = life_time
	
	if is_shaking:
		return
	
	is_shaking = true
	
	while time_left > 0:
		var position = Vector2()
		position.x = rand_range(-magnitude, magnitude)
		position.y = rand_range(-magnitude, magnitude)
		set_position(position)
		time_left -= get_process_delta_time()
		yield(get_tree(), "idle_frame")
	
	magnitude = 0
	is_shaking = false
	set_position(Vector2.ZERO)
