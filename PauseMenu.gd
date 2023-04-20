extends Control

onready var save_file = SaveFile.g_data
var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		self.is_paused = !self.is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _on_MainMenuButton_pressed():
	get_tree().quit()

func _on_ReturnButton_pressed():
	self.is_paused = false

func _on_ControlsButton_pressed():
	pass # Replace with function body.
