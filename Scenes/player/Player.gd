extends KinematicBody2D

#export(int) var run_speed
#export(int) var jump_speed
#export(int) var gravity
const velX = 400
const grav = 1500
var velocity = Vector2(0,0) 

var jump = false
var jump_release = false

#  variaveis de estado
#var state
#var anim
#var new_anim

#enum{IDLE, JUMP, RUN}


func _ready():
	#change_state(IDLE)
	set_process_input(true)
	
#func change_state(new_state):
	
	#state = new_state
	
	#match state:
	#	IDLE:
	#		new_anim = "idle"
	#	RUN:
	#		new_anim = "run"
	#	JUMP:
	#		new_anim = "jump"


#func get_input():
	#var left = Input.is_action_pressed("left")
	#var right = Input.is_action_pressed("right")
#	var jump = Input.is_action_just_pressed("up")
	
	#velocity.x = 0
	
	#if right:
	#	velocity.x += run_speed
	#	$AnimatedSprite.flip_h = false
	
#	if left:
#		velocity.x -= run_speed
#		$AnimatedSprite.flip_h = true
	
#	if jump:
#		velocity.y = jump_speed
	
#	if state == IDLE and velocity.x != 0:
#		change_state(RUN)
#	if state == RUN and velocity.x == 0:
#		change_state(IDLE)
#	if state in [IDLE,RUN] and !is_on_floor():
#		change_state(JUMP)
#	if state == JUMP and is_on_floor():
#		change_state(IDLE)
	#if alguamcoisa:
		#pass

func _physics_process(delta):
	velocity.y += grav * delta
	velocity.x = velX
	velocity = move_and_slide(velocity, Vector2(0,-1))
	
	if is_on_floor():
		$AnimatedSprite.play("walk")
		if jump:
			velocity.y = -800
	else:
		$AnimatedSprite.play("jump")
		if jump_release:
			velocity.y = 0
		
	jump = false
	jump_release = false
#	velocity.y += gravity * delta
	#get_input()
##	if new_anim != anim:
	#	anim = new_anim
	#	$AnimatedSprite.play(anim)
	#velocity = move_and_slide(velocity, Vector2(0,-1))

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			jump = true
		else:
			jump_release = true
