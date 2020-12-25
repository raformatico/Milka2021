extends Control

var current_group : MarginContainer
var index = 0


onready var mensaje : MarginContainer = $mensaje_group
onready var aplausos : MarginContainer = $aplausos_group
onready var leer : MarginContainer = $leer_group
onready var papel : MarginContainer = $papel_group
onready var zoom : MarginContainer = $zoom_group
onready var hueso : Control = $hueso_group
onready var transicion : AnimationPlayer = $transicion
onready var groups : Array = [mensaje, aplausos, leer, papel, zoom, hueso]

func _ready() -> void:
	GeneralAudio.stop()
	for g in groups:
		g.visible = false
	index = 0
	get_tree().paused = false
	groups[index].visible = true
	transicion.play("fade_out")
	index += 1
	

func show_group() -> void:
	if index != 0:
		groups[index-1].visible = false
	
	if groups[index] == hueso:
		transicion.play("fade")
		yield(transicion,"animation_finished")
		groups[index].visible = true
		transicion.play("fade_out_end")
	else:
		transicion.play("fade")
		yield(transicion,"animation_finished")
		groups[index].visible = true
		transicion.play("fade_out")
		index += 1
	

func _on_TextureButton_pressed() -> void:
	show_group()


func _on_salir_pressed() -> void:
	get_tree().change_scene("res://Scenes/Start.tscn")
