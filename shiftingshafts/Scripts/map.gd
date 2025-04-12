extends TileMap

var boxLocation = 30
var rotationScalar = 0.005
var maxRotation = 0
var centerOfRotation = 0
var dir = 1

@onready var box: RigidBody2D = $Box
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#make screen tilt based on box location
	if centerOfRotation == 180:
		dir = -1
	
	boxLocation = box.position.x*dir
	maxRotation = (boxLocation/5)+centerOfRotation
	if maxRotation > centerOfRotation+30:
		maxRotation = centerOfRotation+30
	elif maxRotation < centerOfRotation-30:
		maxRotation = centerOfRotation-30
	
	if abs(maxRotation-rotation_degrees ) > 50:
		rotation_degrees += rotationScalar*200
	elif not rotation_degrees == maxRotation:
		if rotation_degrees>maxRotation:
			rotation_degrees -= abs(boxLocation)*rotationScalar
		else:
			rotation_degrees += abs(boxLocation)*rotationScalar
	
	
	#if rotation_degrees > maxRotation:
	#	while rotation_degrees > maxRotation:
	#		rotation_degrees -= abs(boxLocation)*rotationScalar
	#elif rotation_degrees < maxRotation:
	#	while rotation_degrees < maxRotation:
	#		rotation_degrees += abs(boxLocation)*rotationScalar
	#elif rotation_degrees < maxRotation and rotation_degrees > maxRotation:
	#	rotation_degrees += boxLocation*rotationScalar
	
	#box.rotation_degrees = rotation_degrees
	box.global_rotation = global_rotation
	box.global_rotation_degrees = global_rotation_degrees		
	
	
