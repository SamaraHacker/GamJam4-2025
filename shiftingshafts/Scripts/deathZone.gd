extends Area2D

var dead = false
var deadTimer = 0

func _on_body_entered(body):
	$AudioStreamPlayer2D.play()
	dead = true
	deadTimer = Time.get_ticks_msec()+300
	
	
func _process(delta: float) -> void:
	if dead and deadTimer < Time.get_ticks_msec():
		get_tree().reload_current_scene()
