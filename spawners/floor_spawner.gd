extends Node2D

var floor_path = "res://Fondo/floor.tscn"


func spawn_floor(pos_x : int) -> void:
	var floor_node = load(floor_path).instance()
	floor_node.position.x = pos_x
	add_child(floor_node)
