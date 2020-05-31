extends "res://scripts/Powerup.gd"


func _ready() -> void:
	connect("area_entered", self, "_on_area_entered")

func _on_area_entered(other):
	if other.is_in_group("Ship"):
		other.armor += 1
		queue_free()
