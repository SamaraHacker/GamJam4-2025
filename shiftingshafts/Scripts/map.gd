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
var savedPosition

var i = 0
var j = 0

func _ready():
	offset = box.position.x - position.x 

@onready var box: RigidBody2D = $Box
@onready var player: CharacterBody2D = $Player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	currAngle = rotation_degrees
	#make screen tilt based on box location
	if centerOfRotation == 180:
		dir = -1
	
	boxLocation = (box.position.x + offset)*dir
	targetAngle = (boxLocation/5)+centerOfRotation
	
	targetAngle = clamp(targetAngle, centerOfRotation -30, centerOfRotation + 30)

	if rotation_degrees != targetAngle:
		if abs(rotation_degrees - targetAngle) > 120:
			box.freeze = true
			player.freeze = true
			savedPosition = box.global_position
			print("before", savedPosition)
			started = true
		elif (started):
			if abs(rotation_degrees - targetAngle) < 20:
				started = false
				box.freeze = false
				player.freeze = false
				print("AFter", box.global_position)
				var center = position  # TileMap's local origin
				#box.position = (box.position - center).rotated(PI) + center
		rotation = lerp_angle(rotation, deg_to_rad(targetAngle), 0.05)
	
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
	box.global_rotation = global_rotation
	#box.global_rotation_degrees = global_rotation_degrees		
	
	
