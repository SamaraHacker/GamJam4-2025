extends TileMap

var boxLocation = 30
var rotationScalar = 0.01
var maxRotation = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#make screen tilt based on box location
	
	maxRotation = boxLocation/3
	
	if boxLocation > 0:
		if rotation_degrees < maxRotation:
			rotation_degrees += boxLocation*rotationScalar
	else:
		if rotation_degrees > -maxRotation:
			rotation_degrees += boxLocation*rotationScalar
			
	if rotation_degrees > 30:
		rotation_degrees = 30
	elif rotation_degrees < -30:
		rotation_degrees = -30
	
