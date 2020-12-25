extends Node2D


var gift = "res://Gift/gift.tscn"
var max_gift_numbers = 5
var height = [358, 486]
var background_wide := 2048
var minimum_distance = 160
var maximum_distance = int (background_wide / max_gift_numbers)


func spawn_gifts(pos_x : int) -> void:
	var gift_numbers = randi() % max_gift_numbers + 1
	for i in range(gift_numbers):
		var gift_node = load(gift).instance()
		gift_node.position.x = pos_x + int(rand_range(minimum_distance,maximum_distance))
		gift_node.position.y = height[randi() % 2]
		pos_x = gift_node.position.x
		add_child(gift_node)


func random_distance() -> int:
	var distance : int
	distance = randi() % (maximum_distance - minimum_distance) + minimum_distance
	return distance
