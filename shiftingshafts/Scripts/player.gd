extends CharacterBody2D


const PUSH_SPEED = 20.0
const SPEED = 125.0
const JUMP_VELOCITY = -250.0
const gravScalar = 1.1

var canJump = false
var jumpTicks = 0
var jumpPressed = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * gravScalar

	# Handle jump.
	if Input.is_action_pressed("ui_accept") and canJump:
		velocity.y = JUMP_VELOCITY
		jumpTicks = 0
		
	if is_on_floor():
		canJump = true
		jumpTicks = 5
	
	if jumpTicks == 0:
		canJump = false
	jumpTicks-=1
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collisionBox = collision.get_collider()
		if collisionBox.is_in_group("boxes"):
			collisionBox.set_angular_velocity(0.0)
			collisionBox.apply_central_impulse(collision.get_normal()*-PUSH_SPEED)
	
	
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
