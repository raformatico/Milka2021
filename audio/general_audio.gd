extends Node

onready var musica : AudioStreamPlayer = $AudioStreamPlayer


func play() -> void:
	musica.play()


func stop() -> void:
	musica.stop()
