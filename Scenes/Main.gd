extends Node2D

class_name Main
const Player = preload("res://Scenes/player.tscn")
const Exit = preload("res://Scenes/ExitDoor.tscn")

var borders = Rect2(1, 1, 38, 21)
@onready var tileMap = $TileMap
signal level_update
var level:int = 1:
	get:
		return(level)
	set(value):
		level = value + 1
		emit_signal("level_update", level)

signal toggle_pause(is_paused:bool)
var game_paused:bool = false:
	get:
		return(game_paused)
	set(value):
		game_paused = value
		get_tree().paused = game_paused
		emit_signal("toggle_pause", game_paused)
		

func _ready():
	randomize()

func _input(event:InputEvent):
	if event.is_action_pressed("ui_cancel"):
		game_paused = !game_paused
