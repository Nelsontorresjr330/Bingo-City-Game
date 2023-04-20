extends KinematicBody2D

onready var save_file = SaveFile.g_data

const node_name = "Kinematic Body For Char"
var speed = 170
var in_house = false

var velocity = Vector2(0,0)
var current_step_dict = {
	0 : "idle_left",
	1 : "idle_right",
	2 : "idle_up",
	3 : "idle_down"
}
var current_step = 3

func _ready():
	set_home(null)
	_timer = Timer.new()
	add_child(_timer)
	
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(5.0)
	_timer.set_one_shot(false)
	_timer.start()

var home = null setget set_home

func _unhandled_input(event):
	if event is InputEventKey and event.is_action_pressed("EnterInteraction") and home != null:
		update_save_values()
		SaveFile.save_data()
		home.enter()
	if event.is_action_pressed("ui_cancel"):
		update_save_values()

func set_home(new_home):
	if new_home != null:
		$KeyPrompt.show()
		$KeyPressAnimation.play("KeyPrompt")
	else:
		$KeyPrompt.hide()
		$KeyPressAnimation.stop()
	
	home = new_home

func character_movement():
	if Input.is_action_pressed("ui_left"):
		save_file.gold += 10
		velocity.x = -(speed)
		current_step = 0
		$AnimatedSprite.play("walk_left")
	elif Input.is_action_pressed("ui_right"):
		save_file.gold += 10
		velocity.x = speed
		current_step = 1
		$AnimatedSprite.play("walk_right")
	elif Input.is_action_pressed("ui_up"):
		save_file.gold += 10
		velocity.y = -(speed)
		current_step = 2
		$AnimatedSprite.play("walk_up")
	elif Input.is_action_pressed("ui_down"):
		save_file.gold += 10
		velocity.y = speed
		current_step = 3
		$AnimatedSprite.play("walk_down")
	else:
		$AnimatedSprite.play(current_step_dict[current_step])
	move_and_slide(velocity)
	velocity.x = lerp(velocity.x,0,0.1)
	velocity.y = lerp(velocity.y,0,0.1)

func _physics_process(delta):
	if Input.is_action_pressed("run"):
		speed = 300
	else:
		speed = 170
	character_movement()

func update_save_values():
	save_file.position = global_position

var _timer = null

func _on_Timer_timeout():
	if not in_house:
		update_save_values()
		SaveFile.save_data()

func player_shop_method():
	pass
