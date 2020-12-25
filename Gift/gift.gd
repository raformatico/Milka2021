class_name Gift
extends Area2D

signal gift_picked

onready var hud : CanvasLayer = get_node("/root/world/hud")
onready var sprite : Sprite = $Sprite
onready var gift_sound : AudioStreamPlayer = $gift_sound

func _ready() -> void:
	sprite.frame = randi() % 2
	connect("gift_picked",hud,"_on_gift_gift_picked")


func _on_gift_body_entered(body: Node) -> void:
	if body is Player:
		emit_signal("gift_picked")
		visible = false
		gift_sound.play()
		yield(gift_sound,"finished")
		self.queue_free()

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
