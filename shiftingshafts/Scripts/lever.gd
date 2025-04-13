extends Area2D

@export var ROTATION = 180
var i = 0
@onready var player: CharacterBody2D = $"../Player"

func _on_body_entered(body):
	if i == 0:
		#print("*rumble* *rumble* Woahhhh")
		
		#play rumble sound
		$Sprite2D/AnimationPlayer.play("Flip")
		$AudioStreamPlayer2D.play()
		
		
		#move the screen by rotation val
		get_parent().centerOfRotation = ROTATION 
		player.scale.y = -1
		#maybe apply force on player to shoot them out from wall
		i+=1
	
