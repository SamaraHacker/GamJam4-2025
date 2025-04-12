extends CharacterBody2D


const PUSH_SPEED = 30
const SPEED = 125.0
const MAX_VELOCITY = 50
const JUMP_VELOCITY = -250.0
const gravScalar = 1.1

var canJump = false
var jumpTicks = 0
var jumpPressed = false

var collisionBox = CollisionShape2D.new()

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * gravScalar

	# Handle jump.
	if (Input.is_action_pressed("ui_accept") or Input.is_action_pressed("ui_up")) and canJump:
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
		#if collisionBox.is_in_group("boxes") and not collision.get_collider() == collisionBox:
		#	collisionBox.lock_rotation = false
		collisionBox = collision.get_collider()
		if collisionBox.is_in_group("boxes") and abs(collisionBox.get_linear_velocity().x)< MAX_VELOCITY:
		#	collisionBox.lock_rotation = true
			collisionBox.apply_central_impulse(collision.get_normal()*-PUSH_SPEED)
	
	
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		if Input.is_action_pressed("ui_left"):
			AnimatedSprite2D.scale.x = -1  # Flip to face left
		elif Input.is_action_pressed("ui_right"):
			AnimatedSprite2D.scale.x = 1   # Face right
	
	
	move_and_slide()
