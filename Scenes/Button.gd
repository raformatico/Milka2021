extends Control


export var text := "Button"

onready var label : Label = $TextureButton/Label

func _ready() -> void:
	label.text = text
