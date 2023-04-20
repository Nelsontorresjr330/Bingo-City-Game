extends StaticBody2D

onready var save_file = SaveFile.g_data
var selected = false

func _ready():
	$AnimatedSprite.play("default")

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true

func _physics_process(delta):
	if self.visible == false:
		$CollisionShape2D.disabled = true
	else:
		$CollisionShape2D.disabled = false
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false
