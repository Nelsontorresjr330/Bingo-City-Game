extends Node2D

var entered = false
var outside = "res://Main_Scene.tscn"

func _ready():
	$Main_Character_Body.in_house = true

func _on_Area2D_body_entered(body):
	if entered:
		$Main_Character_Body.in_house = false
		get_tree().change_scene(outside)

func _on_Area2D_body_exited(body):
	entered = true
