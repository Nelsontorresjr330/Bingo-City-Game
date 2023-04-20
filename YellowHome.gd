extends Node2D

export (PackedScene) var interior_scene

func _on_Area2D_body_entered(body):
	body.home = self

func _on_Area2D_body_exited(body):
	if body.home == self:
		body.home = null

func enter():
	get_tree().change_scene(interior_scene.resource_path)
