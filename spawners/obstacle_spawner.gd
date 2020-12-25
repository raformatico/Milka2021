extends Node2D

var obstacles = ["res://Obstacle/big_obstacle.tscn", "res://Obstacle/obstacle.tscn"]
var background_wide := 2048
var obstacle_position_y = [536, 536]
var minimum_distance = 500


func spawn_obstacles(pos_x : int) -> void:
	var number_obstacles := randi() % 4 + 1
	var pos_e := pos_x + background_wide
	for i in range(number_obstacles):
		var obstacle_type = randi() % 2
		var obstacle_node = load(obstacles[obstacle_type]).instance()
		var maximum_distance = (pos_e - pos_x) / (number_obstacles - i)
		var distance = int(rand_range(minimum_distance,maximum_distance))
		obstacle_node.position.x = pos_x + distance
		obstacle_node.position.y = obstacle_position_y[obstacle_type]
		pos_x = obstacle_node.position.x
		add_child(obstacle_node)


