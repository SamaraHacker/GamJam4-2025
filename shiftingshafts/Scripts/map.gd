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
	offset =0 #+ position.x - box.position.x
	

@onready var box: RigidBody2D = $Box
@onready var player: CharacterBody2D = $Player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	currAngle = rotation_degrees
	#make screen tilt based on box location
	if centerOfRotation == 180:
		dir = -1
	
	boxLocation = (box.position.x + offset) * dir
	print("Box location", boxLocation)
	targetAngle = (boxLocation/5)+centerOfRotation
	
	targetAngle = clamp(targetAngle, centerOfRotation -30, centerOfRotation + 30)
	
	if rotation_degrees < -31:
		rotation_degrees += 360

	if rotation_degrees != targetAngle:
		if abs(rotation_degrees - targetAngle) > 120:
			box.freeze = true
			player.velocity = Vector2.ZERO
			savedPosition = box.global_position
			#print("before", savedPosition)
			started = true
		elif (started):
			if abs(abs(rotation_degrees) - targetAngle) < 20:
				print("Turned fully")
				started = false
				box.freeze = false
				#box.position = Vector2(box.position.x, box.position.y-2)
				#print("After", box.global_position)
				#var center = position  # TileMap's local origin
				#box.position = (box.position - center).rotated(PI) + center
			else:
				player.velocity = Vector2.ZERO
		rotation = lerp_angle(rotation, deg_to_rad(targetAngle), 0.05)
		print(rotation_degrees)
		print(targetAngle)
	
	#print("Bot rotation", box.rotation)
	box.global_rotation = global_rotation
	#box.global_rotation_degrees = global_rotation_degrees		
