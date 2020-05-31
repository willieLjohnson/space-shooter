extends "res://scripts/Powerup.gd"


func _ready() -> void:
	connect("area_entered", self, "_on_area_entered")

func _on_area_entered(other):
	if other.is_in_group("ship"):
		other.is_double_shooting = true
		AudioPlayer.play("powerup")
		queue_free()
