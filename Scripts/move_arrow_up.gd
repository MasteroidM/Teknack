extends Area2D

var speed = 100
var sensor = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Move
	position.y += speed * delta

	# Screen exited
	if position.y > 500:
		queue_free()
		print("Up Arrow Exited")
	
	# Sensor and pressed
	if sensor == 1:
		if Global.sensor_ArrowUp == 1:
			if Input.is_action_just_pressed("ui_up"):
				queue_free()


func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	sensor = 1


func _on_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	sensor = 0
