extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var left_button_pressed = false
var right_button_pressed = false
var up_button_pressed = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor() or up_button_pressed:
		velocity.y = JUMP_VELOCITY
		up_button_pressed = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if left_button_pressed:
		direction = -1
	if right_button_pressed:
		direction = 1
		
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	else:
		get_node("AnimatedSprite2D").flip_h = false
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_arrow_down_pressed():
	pass
	
func _on_arrow_left_button_down():
	left_button_pressed = true

func _on_arrow_left_button_up():
	left_button_pressed = false

func _on_arrow_right_button_down():
	right_button_pressed = true

func _on_arrow_right_button_up():
	right_button_pressed = false

func _on_arrow_up_pressed():
	up_button_pressed = true
