class_name Player
extends KinematicBody2D

signal obstacle_hit

export var jump_height := 160
export var jump_time := 0.4
export var fall_multiplier := 2
export var speed := 600
export var extra_speed := 80

var gravity
var jump_velocity
var running : bool = false
var velocity : Vector2 = Vector2.ZERO

onready var timer : Timer = $Timer
onready var animation_player : AnimationPlayer = $AnimationPlayer
onready var hit_sound : AudioStreamPlayer = $hit
onready var jump_sound : AudioStreamPlayer = $jump


func _ready() -> void:
	gravity = (2 * jump_height) / pow(jump_time, 2)
	jump_velocity = - gravity * jump_time

func _physics_process(delta: float) -> void:
	if running:
		velocity.x = speed
		if velocity.y > 0:
			velocity.y += gravity * delta * fall_multiplier
			if animation_player.current_animation != "jump_down":
				animation_player.play("jump_down")
			
		else:
			velocity.y += gravity * delta
		velocity = move_and_slide(velocity, Vector2.UP)
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			if collision.collider.is_in_group("obstacle"):
				hit_obstacle()
		if is_on_floor():
			if animation_player.current_animation != "run":
				animation_player.play("run")
			if Input.is_action_just_pressed("jump"):
				jump_sound.play()
				velocity.y = jump_velocity
				animation_player.play("jump_up")

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			if is_on_floor():
				jump_sound.play()
				velocity.y = jump_velocity
				animation_player.play("jump_up")


func hit_obstacle() -> void:
	emit_signal("obstacle_hit")
	hit_sound.play()
	get_tree().paused = true


func _on_world_start_game() -> void:
	animation_player.play("run")
	running = true
	timer.start()


func _on_Timer_timeout() -> void:
	speed += extra_speed
	#print("New Speed")
	#print(speed)
