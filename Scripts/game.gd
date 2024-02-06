extends Node2D

const ArrowLeft = preload("res://Scenes/move_arrow_left.tscn")
const ArrowRight = preload("res://Scenes/move_arrow_right.tscn")
const ArrowUp = preload("res://Scenes/move_arrow_up.tscn")
const ArrowDown = preload("res://Scenes/move_arrow_down.tscn")

var random = 0
var RNG = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Score/Label.text = str(Global.score)
	pass


func _on_timer_timeout():
	$Timer.start()
	RNG.randomize()
	var random_int = RNG.randi_range(1, 4) # 1 - 4
	random = random_int 
	
	# Random 1 - 4
	if random == 1:
		var ArrowLeftInstance = ArrowLeft.instantiate()
		get_parent().add_child(ArrowLeftInstance)
		ArrowLeftInstance.position = $CreateArrows/Spawner_ArrowLeft.global_position

	if random == 2:
		var ArrowRightInstance = ArrowRight.instantiate()
		get_parent().add_child(ArrowRightInstance)
		ArrowRightInstance.position = $CreateArrows/Spawner_ArrowRight.global_position

	if random == 3:
		var ArrowUpInstance = ArrowUp.instantiate()
		get_parent().add_child(ArrowUpInstance)
		ArrowUpInstance.position = $CreateArrows/Spawner_ArrowUp.global_position

	if random == 4:
		var ArrowDownInstance = ArrowDown.instantiate()
		get_parent().add_child(ArrowDownInstance)
		ArrowDownInstance.position = $CreateArrows/Spawner_ArrowDown.global_position


func _on_button_pressed():
	get_tree().change_scene_to_file("res://.godot/exported/133200997/export-53a0af8f00fbc899d4d541c34a803049-menu.scn")
	
	
