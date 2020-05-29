extends Sprite


func _ready() -> void:
	get_node("Anim").play("fade_out")
	yield(get_node("Anim"), "finished")
	queue_free()
