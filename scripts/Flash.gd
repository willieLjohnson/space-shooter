extends Sprite


func _ready() -> void:
	$Anim.play("fade_out")
	yield($Anim, "animation_finished")
	queue_free()
