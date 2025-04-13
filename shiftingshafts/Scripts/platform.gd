extends Node2D

var crackTime = 0
var steppedOn = false
var playerOff = false

var i = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	steppedOn = false
	crackTime = 1000000000+Time.get_ticks_msec()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if steppedOn:
		$FallingPlatform/AnimationPlayer.play("Cracking")
		#play cracking sound
		crackTime = Time.get_ticks_msec()+2000
		steppedOn = false
	if crackTime < Time.get_ticks_msec() and playerOff:
		#wait a bit
		queue_free()
		
	$FallingPlatform/CollisionShape2D.global_rotation = global_rotation
	#$Area2D/CollisionShape2D.rotation_degrees = rotation_degrees
		


func _on_area_2d_body_entered(body):
	playerOff = false
	steppedOn = true


func _on_area_2d_body_exited(body):
	playerOff = true
