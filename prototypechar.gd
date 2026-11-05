extends CharacterBody2D


var SPEED = 200.0
var JUMP_VELOCITY = -375.0
var dashspeed = 500
var is_dashing = false
var dashcount = 0
var dashdirection = Vector2(0, 0) # TURN ALL DASH RELATED VARIABLES INTO A STRUCT MAYBE
var gravitymult = 0
var timer = 0
var coyotestate = false
var coyoteframes = 5
var previousframeonground = true

func _physics_process(delta: float) -> void:
	if timer <= 0 && is_dashing == true:
		is_dashing = false # resets dash state to false when timer for physics ignore runs out
		if !is_on_floor():
			velocity.y = -100 # perfect number where you can't use spacebar to jump after a dash to gain height
	
	# Add the gravity.
	if not is_on_floor() && is_dashing == false: # we want to ignore physics if character is dashing
		if abs(velocity.y) <= 20:
			gravitymult = 0.8
			velocity.y += get_gravity().y * gravitymult * delta
		elif Input.is_action_pressed("ui_up") && velocity.y < 0:
			gravitymult = 0.8
			velocity.y += get_gravity().y * gravitymult * delta
		else:
			if gravitymult < 1.3:
				gravitymult += 0.1
			velocity.y += get_gravity().y * gravitymult * delta

	# Handle jump.
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction && is_dashing == false:
		velocity.x = direction * SPEED
	else:
		velocity.x *= 0.8
		
	if global_position.x > 976:
		global_position.x = -16
		dashcount = 0
	elif global_position.x < -16:
		global_position.x = 976
		dashcount = 0
	if global_position.y > 556:
		global_position.y = -16
		
	if previousframeonground == true && !is_on_floor() && velocity.y >= 0:
		coyotestate = true
	if coyotestate == true:
		velocity.y = 0
		coyoteframes -= 1
	if coyoteframes == 0:
		coyotestate = false
		coyoteframes = 2
	previousframeonground = is_on_floor()
		
	get_direction()
		
	if Input.is_action_just_pressed("dash"):
		if dashcount == 0: # change to a dynamic variable when adding double dashes
			is_dashing = true
			dashcount += 1
			timer = 0.15
	
	if is_on_floor() && is_dashing == false:
		is_dashing = false
		dashcount = 0
		timer = 0.15
	
	if is_dashing == true:
		timer -= delta
		velocity.x = (dashspeed * dashdirection.x * 1.5) # the 1.5 just makes the physics work nicer
		velocity.y = (dashspeed * dashdirection.y * 1.4) # same with the 1.4, the physics just works nicer

	move_and_slide()

func get_direction():
	if is_dashing == true:
		return
	dashdirection.y = 0 # resets incase no up/down input
	dashdirection.x = 0 # same here but this should be fixed comment below
	if Input.is_action_pressed("updashcheck"):
		dashdirection.y = -1
	if Input.is_action_pressed("ui_down"):
		dashdirection.y = 1
	# for up/down
	
	if Input.is_action_pressed("ui_left"):
		dashdirection.x = -1
	if Input.is_action_pressed("ui_right"):
		dashdirection.x = 1
		

	# for left/right
	# this automatically assumes to not dash if player isnt actively pressing left
	# fix this later to dash the direction the player is facing
		
		
