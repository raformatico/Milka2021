extends Control


func _ready() -> void:
	get_tree().paused = false
	GeneralAudio.play()


func _on_start_pressed() -> void:
	get_tree().change_scene("res://world.tscn")
