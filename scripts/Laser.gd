extends Area2D

export var velocity = Vector2()
const flare_scene = preload("res://scenes/Flare.tscn")

func _ready() -> void:
	set_process(true)
	create_flare()
	
	yield(get_node("VisibilityNotifier2D"), "exit_screen")
	queue_free()


func _process(delta: float) -> void:
	translate(velocity * delta)

func create_flare() -> void:
	var flare = flare_scene.instance()
	flare.set_position(get_position())
	Utils.main_node.add_child(flare)
