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
			savedPosition = box.global_position
			print("before", savedPosition)
			started = true
		elif (started):
			#savedPosition = box.position
			if abs(rotation_degrees - targetAngle) > 5:
				box.freeze = false
				print("AFter", box.global_position)
				var center = position  # TileMap's local origin
				started = false
				box.position = (box.position - center).rotated(PI) + center
		rotation = lerp_angle(rotation, deg_to_rad(targetAngle), 0.05)
	
	box.global_rotation = global_rotation		
	
	
