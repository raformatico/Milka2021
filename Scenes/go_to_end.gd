extends Control

onready var label : Label = $CenterContainer/VBoxContainer/Label


func _on_retry_pressed() -> void:
	get_tree().change_scene("res://world.tscn")


func _on_premio_pressed() -> void:
	get_tree().change_scene("res://Scenes/end_screen.tscn")
