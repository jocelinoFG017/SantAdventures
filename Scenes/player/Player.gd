extends KinematicBody2D

#export(int) var run_speed
#export(int) var jump_speed
#export(int) var gravity
const velX = 400
const grav = 1500

enum{IDLE, JUMP, RUNNING, DEAD}

var velocity = Vector2(0,0) 

var jump = false
var jump_release = false
var controled_jump = false

onready var mask = collision_mask
onready var layer = collision_layer
#  variaveis de estado
var status = RUNNING
#var anim
#var new_anim




func _ready():
	#change_state(IDLE)
	set_process_input(true)

func _physics_process(delta):
	if status == RUNNING:
		running(delta)
	elif status == DEAD:
		dead(delta)
	if status != DEAD:
		if position.y > ProjectSettings.get_setting("display/window/size/height"):
			killed()
	
	jump = false
	jump_release = false

func running(delta):
	velocity.y += grav * delta
	velocity.x = velX
	velocity = move_and_slide(velocity, Vector2(0,-1))
	
	if is_on_floor():
		$AnimatedSprite.play("walk")
		if jump:
			jump(1000, true)
	else:
		$AnimatedSprite.play("jump")
		if jump_release and velocity.y < 0 and controled_jump:
			velocity.y *= 0.2
		

func dead(delta):
	translate(velocity * delta)
	velocity.y += grav * delta
	$AnimatedSprite.visible = false
	get_tree().change_scene("res://Scenes/levels/selector/LevelSelector.tscn")
	
	

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			jump = true
		else:
			jump_release = true

func jump(force, controled):
	velocity.y = -force
	controled_jump = controled

func killed():
	if status != DEAD:
		status = DEAD
		collision_layer = 0
		collision_mask = 0
		velocity = Vector2(0, -1000)
		$AudioStreamPlayer.play()
		yield(get_tree().create_timer(0.2), "timeout")
		$AudioStreamPlayer.stop()
