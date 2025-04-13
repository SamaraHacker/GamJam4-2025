extends AnimatableBody2D

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
		$AnimationPlayer.play("Cracking")
		#play cracking sound
		crackTime = Time.get_ticks_msec()+2000
		steppedOn = false
	if crackTime < Time.get_ticks_msec() and playerOff:
		#wait a bit
		queue_free()
		


func _on_area_2d_body_entered(body):
	
	steppedOn = true
	print(steppedOn)


func _on_area_2d_body_exited(body):
	playerOff = true
