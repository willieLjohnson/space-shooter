extends Area2D

const SIZE = 7
var velocity = Vector2(0, 200)

func _ready() -> void:
	set_process(true)
	

func _process(delta: float) -> void:
	translate(velocity * delta)
	
	if get_position().y >= Utils.view_size.y + SIZE:
		queue_free()
