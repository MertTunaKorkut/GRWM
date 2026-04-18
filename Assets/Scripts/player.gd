extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -600.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if PlayerStats.is_in_dialogue:
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Here we get the input direction: -1, 0, 1
	var direction := Input.get_axis("walk_left", "walk_right")
	var running := Input.is_key_pressed(KEY_SHIFT)
	
	# Here we will flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	# Here we will play the animations
	if is_on_floor():
		if direction == 0:
			match PlayerStats.clothing_stats:
				Vector3i(0,0,0):
					animated_sprite.play("idle_inside_no_backpack_no_shoes")
				Vector3i(1,0,0):
					animated_sprite.play("idle_inside_no_backpack_shoes")
				Vector3i(0,0,1):
					animated_sprite.play("idle_inside_backpack_no_shoes")
				Vector3i(1,0,1):
					animated_sprite.play("idle_inside_backpack_shoes")
				Vector3i(0,1,0):
					animated_sprite.play("idle_clothes_no_backpack_no_shoes")
				Vector3i(1,1,0):
					animated_sprite.play("idle_clothes_no_backpack_shoes")
				Vector3i(0,1,1):
					animated_sprite.play("idle_clothes_backpack_no_shoes")
				Vector3i(1,1,1):
					animated_sprite.play("idle_clothes_backpack_shoes")
		else:
			if running:
				match PlayerStats.clothing_stats:
					Vector3i(0,0,0):
						animated_sprite.play("walk_inside_normal_no_backpack_no_shoes", 1.5)
					Vector3i(1,0,0):
						animated_sprite.play("walk_inside_normal_no_backpack_shoes", 1.5)
					Vector3i(0,0,1):
						animated_sprite.play("walk_inside_normal_backpack_no_shoes", 1.5)
					Vector3i(1,0,1):
						animated_sprite.play("walk_inside_normal_backpack_shoes", 1.5)
					Vector3i(0,1,0):
						animated_sprite.play("walk_clothes_normal_no_backpack_no_shoes", 1.5)
					Vector3i(1,1,0):
						animated_sprite.play("walk_clothes_normal_no_backpack_shoes", 1.5)
					Vector3i(0,1,1):
						animated_sprite.play("walk_clothes_normal_backpack_no_shoes", 1.5)
					Vector3i(1,1,1):
						animated_sprite.play("walk_clothes_normal_backpack_shoes", 1.5)
			else:
				match PlayerStats.clothing_stats:
					Vector3i(0,0,0):
						animated_sprite.play("walk_inside_normal_no_backpack_no_shoes")
					Vector3i(1,0,0):
						animated_sprite.play("walk_inside_normal_no_backpack_shoes")
					Vector3i(0,0,1):
						animated_sprite.play("walk_inside_normal_backpack_no_shoes")
					Vector3i(1,0,1):
						animated_sprite.play("walk_inside_normal_backpack_shoes")
					Vector3i(0,1,0):
						animated_sprite.play("walk_clothes_normal_no_backpack_no_shoes")
					Vector3i(1,1,0):
						animated_sprite.play("walk_clothes_normal_no_backpack_shoes")
					Vector3i(0,1,1):
						animated_sprite.play("walk_clothes_normal_backpack_no_shoes")
					Vector3i(1,1,1):
						animated_sprite.play("walk_clothes_normal_backpack_shoes")
	
	# Here we will apply the movement
	if direction:
		if running:
			velocity.x = direction * (SPEED + 50)
		else:
			velocity.x = direction * SPEED
	else:
		if running:
			velocity.x = move_toward(velocity.x, 0, SPEED + 50)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
