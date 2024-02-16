extends Area2D

@onready var animp = $AnimationPlayer
var sensor = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Sensor and pressed "Hit"
	if sensor == 1:
		if Input.is_action_just_pressed("ui_left"):
			#Global.taps += 1
			animp.play("Hit")
			print("Left Hit")
			Global.score += 10
	
	if sensor == 0:
		if Input.is_action_just_pressed("ui_left"):
			#Global.taps += 1
			animp.play("RESET")
			print("Left Bad")
			Global.score -= 5

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	sensor = 1
	Global.sensor_ArrowLeft = 1

func _on_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	sensor = 0
	Global.sensor_ArrowLeft = 0


func _on_arrow_left_pressed():
	Global.taps += 1
	if sensor == 1:
		animp.play("Hit")
		print("Left Hit")
		Global.score += 10
		Global.emit_signal("left_hit")
	if sensor == 0:
		animp.play("RESET")
		print("Left Bad")
		Global.score -= 5
