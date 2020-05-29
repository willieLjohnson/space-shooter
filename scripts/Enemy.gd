extends Area2D

const SIZE = 16

export var velocity = Vector2()

func _ready() -> void:
	set_process(true)
	

func _process(delta: float) -> void:
	translate(velocity * delta)
	
	if get_position().y - SIZE >= get_viewport_rect().size.y:
		queue_free()
