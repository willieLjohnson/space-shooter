extends Area2D

export var velocity = Vector2()
const FLARE_SCENE = preload("res://scenes/Flare.tscn")

func _ready() -> void:
	set_process(true)
	create_flare()
	
	yield($VisibilityNotifier2D, "screen_exited")
	queue_free()


func _process(delta: float) -> void:
	translate(velocity * delta)

func create_flare() -> void:
	var flare = FLARE_SCENE.instance()
	flare.set_position(get_position())
	Utils.main_node.add_child(flare)
