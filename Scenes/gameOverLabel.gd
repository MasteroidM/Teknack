extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$gameOverLabel.visible=false
	$gameOverScoreLabel.visible=false
	$gameOverScoreValue.visible=false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# Function to show the game over label
func showGameOverLabel():
	$gameOverLabel.visible = true

# Function to hide the game over label
func hideGameOverLabel():
	$gameOverLabel.visible = false
