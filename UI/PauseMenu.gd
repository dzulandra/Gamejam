extends Control

@export var main : Main
@onready var confirmation_popup = preload("res://UI/quit pop up.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	main.connect("toggle_pause", _on_main_game_paused)
	$Panel/VBoxContainer/Resume.grab_focus()
	confirmation_popup.connect("confirmed_to_desktop", _on_quit_to_desktop_confirmed)
	confirmation_popup.connect("confirmed_to_main_menu", _on_quit_to_main_menu_confirmed)
	add_child(confirmation_popup)

func _process(delta):
	pass

func _on_main_game_paused(is_paused):
	if is_paused:
		show()
	else:
		confirmation_popup.hide()
		hide()

func _on_resume_pressed():
	main.game_paused = false

func _on_quit_game_pressed():
	confirmation_popup.mode = "quit_to_desktop"
	confirmation_popup.show()

func _on_quit_pressed():
	confirmation_popup.mode = "quit_to_main_menu"
	confirmation_popup.show()

func _on_save_pressed():
	
	pass # Replace with function body.	

func _on_quit_to_desktop_confirmed():
	main.game_paused = false
	get_tree().quit()

func _on_quit_to_main_menu_confirmed():
	main.game_paused = false
	get_tree().change_scene_to_file("res://UI/MainMenu.tscn")
