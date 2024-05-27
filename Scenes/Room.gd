extends Node2D
const Player = preload("res://Scenes/player.tscn")
const Exit = preload("res://Scenes/ExitDoor.tscn")

var borders = Rect2(1, 1, 38, 21)
@onready var tileMap = $TileMap
var level

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
	generate_level()

func generate_level():
	var walker = Walker.new(Vector2(20, 11), borders)
	var map = walker.walk(200)
	
	var player = Player.instantiate()
	add_child(player)
	player.position = map.front()*32
	
	var exit = Exit.instantiate()
	add_child(exit)
	exit.position = walker.get_end_room().position*32
	exit.connect("leaving_level", Callable(self, "reload_level"))
	
	walker.queue_free()
	for location in map:
		var tile_pos = location
		tileMap.set_cell(0, tile_pos, 0, Vector2i(-1,1))
	connect_atlas_tiles(tileMap)

func reload_level(level):
	print (level)
	if level <= 3:
		get_tree().reload_current_scene()
	else :
		get_tree().quit()

func _input(event:InputEvent):
	if event.is_action_pressed("ui_cancel"):
		game_paused = !game_paused

func connect_atlas_tiles(tilemap):
	var used_cells = tilemap.get_used_cells(0)
	tilemap.set_cells_terrain_connect(0,used_cells, 0, 0)
