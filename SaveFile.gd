extends Node

const SAVE_FILE = "user://save_file.save"
var g_data = {}

func _ready():
	load_data()

func save_data():
	var file = File.new()
	file.open(SAVE_FILE, file.WRITE)
	file.store_var(g_data)
	file.close()

func load_data():
	var file = File.new()
	if not file.file_exists(SAVE_FILE):
		g_data = {
			"position" : Vector2(0.0,0.0),
			"gold" : 10,
			"ownedList" : [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
		}
		save_data()
	file.open(SAVE_FILE, file.READ)
	g_data = file.get_var()
	file.close()

func save_exists():
	var file = File.new()
	if not file.file_exists(SAVE_FILE):
		return false
	return true
