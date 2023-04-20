extends Control

onready var save_file = SaveFile.g_data
var continue_button = false

func _ready():
	continue_button = SaveFile.save_exists()

func _on_NewCharButton_pressed():
	save_file.position = Vector2(0.0,0.0)
	save_file.gold = 100
	save_file.ownedList = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
	SaveFile.save_data()
	SaveFile.load_data()
	get_tree().change_scene("res://Main_Scene.tscn")
	

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_ContinueButton_pressed():
	if continue_button:
		get_tree().change_scene("res://Main_Scene.tscn")
	else:
		$VBoxContainer.ContinueButton.hide() 


func _on_ControlsButton_pressed():
	$InstructionsDialog.popup()
