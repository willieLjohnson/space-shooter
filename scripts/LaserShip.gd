extends "res://scripts/Laser.gd"


func _ready() -> void:
	connect("area_entered", self, "_on_area_entered")
	AudioPlayer.play2D("laser_ship", self)
	
	
func _on_area_entered(other) -> void:
	if other.is_in_group("enemy"):
		other.armor -= 1
		create_flare()
		Utils.remote_call("Camera", "shake", 1, 0.13)
		queue_free()
