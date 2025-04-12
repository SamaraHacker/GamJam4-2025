extends Area2D

@export var ROTATION = 180
var i = 0
@onready var player: CharacterBody2D = $"../Player"

func _on_body_entered(body):
	if i == 0:
		print("*rumble* *rumble* Woahhhh")
		#move the screen by rotation val
		get_parent().centerOfRotation = ROTATION 
		player.scale.y = -1
		i+=1
	
	
	
