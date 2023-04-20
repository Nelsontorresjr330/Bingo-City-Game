extends Node2D

onready var save_file = SaveFile.g_data

# Called when the node enters the scene tree for the first time.
func _ready():
	print(global_position)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Main_Character_Body.global_position = save_file.position
