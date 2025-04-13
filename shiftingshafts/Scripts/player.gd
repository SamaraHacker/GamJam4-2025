extends CharacterBody2D


const PUSH_SPEED = 40
const SPEED = 125.0
const MAX_VELOCITY = 50
const JUMP_VELOCITY = -250.0
const gravScalar = 1.1

var canJump = false
var jumpTicks = 0
var jumpPressed = false
var world_rotated = false

var collisionBox = CollisionShape2D.new()

var pushTime = 0

var i = 0
var j = 0

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var hat: Sprite2D = $Sprite2D/Hat
@onready var map: TileMap = $".."
@onready var pause_menu: Control = $"../../../pause_menu"

func _input(event):
	if event.is_action_pressed("ui_cancel"):  # This is for the Escape key
		#get_tree().change_scene_to_file("res://Scenes/Menu/pause_menu.tscn")
		pause_menu.visible = true
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
 
func _ready():
	$Sprite2D/AnimationPlayer.play("Idle")
	$Sprite2D/Hat.frame_coords.x = Global.player_hat_number
	update_player_colors()
	get_tree().paused = false
	pause_menu.visible = false
 
func update_player_colors():
	print("Updating player colors!")
	var shader_material := sprite_2d.material as ShaderMaterial
	if shader_material:
		print("Setting shader parameters!")
		shader_material.set_shader_parameter("NEWCOLORMAIN", Global.player_main_color)
		shader_material.set_shader_parameter("NEWCOLORSECONDARY", Global.player_secondary_color)
	else:
		print("ShaderMaterial not found on Sprite2D!")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * gravScalar

	# Handle jump.
	if (Input.is_action_pressed("ui_accept") or Input.is_action_pressed("ui_up")) and canJump:
		$Sprite2D/AnimationPlayer.play("Jump")
		velocity.y = JUMP_VELOCITY
		jumpTicks = 0
		
	if is_on_floor():
		if not(Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")):
			$Sprite2D/AnimationPlayer.play("Idle")
		elif Time.get_ticks_msec() > pushTime:
			$Sprite2D/AnimationPlayer.play("Walk")
			if(j % 10 == 0):
				hat.rotation_degrees += ((i % 2) * 2 - 1)*5
				i += 1
			j += 1
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
			if is_on_floor() and abs(position.y - collisionBox.position.y) < 5:
				pushTime = Time.get_ticks_msec()+200
				$Sprite2D/AnimationPlayer.play("Push")
			collisionBox.apply_central_impulse(collision.get_normal()*-PUSH_SPEED)
	
	
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	var world_rotation = int(get_parent().rotation_degrees) % 360
	
	if world_rotation < 0:
		world_rotation += 360
		
	var world_rotated = false
	
	if(world_rotation > 150 and world_rotation < 210):
		world_rotated = true
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
	if direction != 0:
		if world_rotated:
			sprite_2d.scale.x = -direction
		else:
			sprite_2d.scale.x = direction
	
	
	move_and_slide()
