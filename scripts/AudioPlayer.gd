extends Node


func _ready() -> void:
	pass

func play2D(sample_name: String, parent: Node2D) -> void:
	var player = AudioStreamPlayer2D.new()
	player.stream = $AudioLoader.get_resource(sample_name)
	player.connect("finished", player, "queue_free")
	player.play()
	parent.add_child(player)

func play(sample_name: String) -> void:
	var player = AudioStreamPlayer.new()
	player.stream = $AudioLoader.get_resource(sample_name)
	player.connect("finished", player, "queue_free")
	player.play()
	add_child(player)
