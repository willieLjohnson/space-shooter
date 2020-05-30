extends Sprite


func _ready() -> void:
	yield(Utils.create_timer(1), "timeout")
	
	randomize()
	set_rotation(deg2rad(rand_range(0, 360)))
	
	$ParticleSmoke.emitting = true
	$ParticleFlare.emitting = true
	
	$Anim.play("fade_out")
	yield($Anim, "animation_finished")
