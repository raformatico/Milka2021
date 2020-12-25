extends Control

onready var label : Label = $CenterContainer/VBoxContainer/Label


func _ready() -> void:
	pass # Replace with function body.
	


func change_message(points : String) -> void:
	if points == "1":
		label.text = """Milka! 
Sólo has conseguido %s regalo.
Intenta conseguir al menos 10 para que te demos tu premio""" % points
	else:
		label.text = """Milka! 
Sólo has conseguido %s regalos.
Intenta conseguir al menos 10 para que te demos tu premio""" % points


func _on_retry_pressed() -> void:
	get_tree().change_scene("res://world.tscn")


func _on_exit_pressed() -> void:
	get_tree().change_scene("res://Scenes/Start.tscn")
