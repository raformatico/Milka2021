extends CanvasLayer

var time_0
var time
var game_started := false
onready var points_label : Label = $GUI/HBoxContainer/MarginContainer2/ColorRect/Label
onready var time_label : Label = $GUI/HBoxContainer/Time/ColorRect2/time
onready var retry : Control = $retry
onready var gotoend : Control = $go_to_end

func _ready() -> void:
	retry.visible = false
	gotoend.visible = false


func _process(delta: float) -> void:
	if game_started:
		var time_1 := int(OS.get_ticks_msec( ) / 100)
		if time_1 > time:
			time_label.text = str(time_1 - time_0)
			time = time_1

func _on_gift_gift_picked() -> void:
	points_label.text = str(int(points_label.text) + 1)


func show_retry() -> void:
	retry.change_message(points_label.text)
	retry.visible = true


func show_final_message() -> void:
	gotoend.visible = true


func _on_world_start_game() -> void:
	game_started = true
	time_0 = int(OS.get_ticks_msec( ) / 100)
	time = time_0
