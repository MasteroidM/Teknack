extends Node

## GLOBAL ##

# Score
var score = 0

# Signal
signal left_hit
signal right_hit
signal down_hit
signal up_hit

# Taps
var taps = 0

# Miss
var miss = 0

# Sensor
var sensor_ArrowLeft = 0
var sensor_ArrowRight = 0
var sensor_ArrowUp = 0
var sensor_ArrowDown = 0

static func _init():
	if !Engine.has_singleton("Global"):
		Engine.register_singleton("Global", load("res://Scripts/Global.gd"))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
