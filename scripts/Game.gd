extends Node

var bestscore: int = 0 setget set_bestscore
const FILE_PATH: String = "user://bestscore.data"

func _ready() -> void:
	load_bestscore()


func load_bestscore() -> void:
	var file = File.new()
	if not file.file_exists(FILE_PATH): return
	file.open(FILE_PATH, File.READ)
	bestscore = file.get_var()
	file.close()
	
func save_bestscore() -> void:
	var file = File.new()
	file.open(FILE_PATH, File.WRITE)
	file.store_var(bestscore)
	file.close

func set_bestscore(new_value: int) -> void:
	bestscore = new_value
	save_bestscore()
