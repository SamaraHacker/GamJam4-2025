extends AnimatableBody2D

var crackTime = 0
var steppedOn = false

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
		if i == 0:
			crackTime = Time.get_ticks_msec()+2000
		i=1
	if steppedOn and crackTime < Time.get_ticks_msec():
		$AnimationPlayer.play("Falling")


#func _on_area_2d_body_entered(body):
#	
#	steppedOn = true
#	print(steppedOn)
