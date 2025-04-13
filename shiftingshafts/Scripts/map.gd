extends TileMap

var boxLocation = 0
var rotationScalar = 0.005
var targetAngle = 0
var prevCenter = 0
var centerOfRotation = 0
var dir = 1
var currAngle = 0
var offset = 0

#var timer = 0
var started = false

var i = 0

func _ready():
	offset = box.position.x - position.x 

@onready var box: RigidBody2D = $Box
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	currAngle = rotation_degrees
	#make screen tilt based on box location
	if centerOfRotation == 180:
		dir = -1
	
	boxLocation = (box.position.x + offset)*dir
	print(boxLocation)
	targetAngle = (boxLocation/5)+centerOfRotation
	print("Target Angle", targetAngle)
	print("Actual Angle", (rotation_degrees))
	
	targetAngle = clamp(targetAngle, centerOfRotation -30, centerOfRotation + 30)

	if rotation_degrees != targetAngle:
		if abs(rotation_degrees - targetAngle) > 20:
			box.set_gravity_scale(0)
		else:
			box.set_gravity_scale(0.5)
		rotation = lerp_angle(rotation, deg_to_rad(targetAngle), 0.1)
		#print(rotation_degrees)
		#print(targetAngle)
	#if rotation_degrees > maxRotation:
	#	while rotation_degrees > maxRotation:
	#		rotation_degrees -= abs(boxLocation)*rotationScalar
	#elif rotation_degrees < maxRotation:
	#	while rotation_degrees < maxRotation:
	#		rotation_degrees += abs(boxLocation)*rotationScalar
	#elif rotation_degrees < maxRotation and rotation_degrees > maxRotation:
	#	rotation_degrees += boxLocation*rotationScalar
	
	#box.rotation = rotation
	#print("Bot rotation", box.rotation)
	#box.global_rotation = rotation
	box.global_rotation_degrees = global_rotation_degrees		
	
	
