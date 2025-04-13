extends Area2D

@export var ROTATION = 180
var i = 0
@onready var player: CharacterBody2D = $"../Player"

var soundTime = 0
var switchTriggered = false

func _on_body_entered(body):
	if i == 0:
		#print("*rumble* *rumble* Woahhhh")
		
		#play rumble sound
		$Sprite2D/AnimationPlayer.play("Flip")
		$AudioStreamPlayer2D.play()
		
		soundTime = Time.get_ticks_msec()+1000
		switchTriggered = true
		
		#move the screen by rotation val
		get_parent().centerOfRotation = ROTATION 
		player.scale.y = -1
		#maybe apply force on player to shoot them out from wall
		i=1
	
func _process(delta: float) -> void:
	if Time.get_ticks_msec() > soundTime and switchTriggered:
		if i == 1:
			$AudioStreamPlayer2D.queue_free()
			i=2
	
