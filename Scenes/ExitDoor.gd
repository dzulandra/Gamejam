extends Area2D

signal leaving_level
var level = 1
const main = preload("res://Scenes/Main.tscn")

func _on_ExitDoor_body_entered(body):
	emit_signal("leaving_level", level)

func _ready():
	main.connect("update_level", Callable(self, "set_level"))

func set_level(level):
	level = level + 1
	emit_signal("update", level)
