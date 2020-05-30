extends Sprite


func _ready() -> void:
	randomize()
	set_rotation(deg2rad(rand_range(0, 360)))
	
	$ParticleSmoke.emitting = true
	$ParticleFlare.emitting = true
	
	Utils.remote_call("Camera", "shake", 8, 0.2)
	
	$Anim.play("fade_out")
	yield($Anim, "animation_finished")
