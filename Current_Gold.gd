extends Control

onready var save_file = SaveFile.g_data

func _physics_process(delta):
	var format_string = "Current Gold: %s"
	var actual_string = format_string % save_file.gold
	$Gold_Text.set_text(actual_string)

