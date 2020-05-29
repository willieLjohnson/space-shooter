extends Area2D

const SIZE = 16

export var armor = 2 setget set_armor
export var velocity = Vector2()

func _ready() -> void:
	set_process(true)
	add_to_group("enemy")
	connect("area_entered", self, "_on_area_entered")
	

func _process(delta: float) -> void:
	translate(velocity * delta)
	
	if get_position().y - SIZE >= get_viewport_rect().size.y:
		queue_free()
	
func _on_area_entered(other) -> void:
	if other.is_in_group("ship"):
		other.armor -= 1
		queue_free()


func set_armor(new_value):
	armor = new_value
	if armor <= 0: 
		queue_free()
