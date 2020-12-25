extends Node2D

signal start_game

onready var floor_spawner = $floor_spawner
onready var gift_spawner = $gift_spawner
onready var obstacle_spawner = $obstacle_spawner
onready var player : KinematicBody2D = $player
onready var hud : CanvasLayer = $hud

var maximum_points := 0
var game_started := false
var background_wide := 2048
var screen_wide := 1024
var position_to_spawn = 2048


func _ready() -> void:
	get_tree().paused = false
	randomize()

func _physics_process(delta: float) -> void:
	if player.position.x + screen_wide > position_to_spawn:
		floor_spawner.spawn_floor(position_to_spawn)
		gift_spawner.spawn_gifts(position_to_spawn)
		obstacle_spawner.spawn_obstacles(position_to_spawn)
		position_to_spawn += background_wide
		
		
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and not game_started:
		emit_signal("start_game")
		game_started = true

	elif event is InputEventScreenTouch:
		if event.is_pressed():
			emit_signal("start_game")
			game_started = true

func _on_player_obstacle_hit() -> void:
	var points := int(hud.points_label.text)
	if points > maximum_points:
		maximum_points = points
	
	if maximum_points >= 10:
		hud.show_final_message()
	else:
		hud.show_retry()
