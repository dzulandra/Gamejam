extends Control

@export var move_to :PackedScene
var splash_screens: Array[SplashScreen] = []

@onready var splash_screen_container:CenterContainer = $SplashScreenContainer

func _ready():
	assert(move_to)
	
	for splash_screen in splash_screen_container.get_children():
		splash_screen.hide()
		splash_screens.push_back(splash_screen)
	_start_splash_screen()
	
func _start_splash_screen():
	if splash_screens.size() ==0:
		get_tree().change_scene_to_packed(move_to)
	else :
		var _splash_screen:SplashScreen = splash_screens.pop_front()
		_splash_screen._start()
		_splash_screen.connect("finished", _start_splash_screen)
