extends Control

func _ready():
	$VBoxContainer/Start.grab_focus()

func _process(delta):
	pass

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_load_pressed():
	pass # Replace with function body.

func _on_option_pressed():
	pass # Replace with function body.
