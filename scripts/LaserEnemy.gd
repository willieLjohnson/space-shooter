extends "res://scripts/Laser.gd"


func _ready() -> void:
	connect("area_entered", self, "_on_area_entered")
	
	
func _on_area_entered(other) -> void:
	if other.is_in_group("ship"):
		other.armor -= 1
		create_flare()
		queue_free()
