extends TileMap

var boxLocation = 30
var rotationScalar = 0.005
var maxRotation = 0

@onready var box: RigidBody2D = $Box
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#make screen tilt based on box location
	boxLocation = box.position.x 
	maxRotation = boxLocation/5
	if maxRotation > 30:
		maxRotation = 30
	elif maxRotation < -30:
		maxRotation = -30
	
	if rotation_degrees > maxRotation:
		rotation_degrees = maxRotation
	elif rotation_degrees < maxRotation:
		rotation_degrees = maxRotation
	elif rotation_degrees < maxRotation and rotation_degrees > -maxRotation:
		rotation_degrees += boxLocation*rotationScalar
	
	#box.rotation_degrees = rotation_degrees
	box.global_rotation = global_rotation
	box.global_rotation_degrees = global_rotation_degrees		
	
	
