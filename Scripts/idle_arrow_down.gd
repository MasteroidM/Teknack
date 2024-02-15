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
		Global.taps += 1
		if Input.is_action_just_pressed("ui_down"):
			animp.play("Hit")
			print("Down Hit")
			Global.score += 10
	
	if sensor == 0:
		Global.taps += 1
		if Input.is_action_just_pressed("ui_down"):
			animp.play("RESET")
			print("Down Bad")
			Global.score -= 5

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	sensor = 1
	Global.sensor_ArrowDown = 1

func _on_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	sensor = 0
	Global.sensor_ArrowDown = 0


func _on_arrow_down_pressed():
	Global.taps += 1
	if sensor == 1:
		animp.play("Hit")
		print("Down Hit")
		Global.score += 10
		Global.emit_signal("down_hit")
	if sensor == 0:
		animp.play("RESET")
		print("Down Bad")
		Global.score -= 5
