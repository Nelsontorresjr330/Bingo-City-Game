extends Node2D

onready var save_file = SaveFile.g_data

func _ready():
	$shopmenu/CanvasLayer.visible = false

func _process(delta):
	if save_file.ownedList[0] == true:
		$pink_flowers.visible = true
	if save_file.ownedList[1] == true:
		$orange_flowers.visible = true
	if save_file.ownedList[2] == true:
		$purple_flowers.visible = true
	if save_file.ownedList[3] == true:
		$magenta_flowers.visible = true
	if save_file.ownedList[4] == true:
		$white_flowers.visible = true
	if save_file.ownedList[5] == true:
		$yellow_flowers.visible = true
	if save_file.ownedList[6] == true:
		$white_flower_bed.visible = true
	if save_file.ownedList[7] == true:
		$yellow_flower_bed.visible = true
	if save_file.ownedList[8] == true:
		$pink_flower_bed.visible = true
	if save_file.ownedList[9] == true:
		$blue_picnic.visible = true
	if save_file.ownedList[10] == true:
		$pink_picnic.visible = true
	if save_file.ownedList[11] == true:
		$blue_seesaw.visible = true
	if save_file.ownedList[12] == true:
		$red_seesaw.visible = true
	if save_file.ownedList[13] == true:
		$tan_seesaw.visible = true
	if save_file.ownedList[14] == true:
		$sandbox.visible = true
	if save_file.ownedList[15] == true:
		$blue_trampoline.visible = true
	if save_file.ownedList[16] == true:
		$yellow_trampoline.visible = true
	

func _on_Area2D_body_entered(body):
	if body.has_method("player_shop_method"):
		$shopmenu/CanvasLayer.visible = true

func _on_Area2D_body_exited(body):
	$shopmenu/CanvasLayer.visible = false

#save_file.position = global_position
