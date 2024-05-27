extends Control
signal confirmed_to_desktop()
signal confirmed_to_main_menu()
var mode: String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_yes_pressed():
	if mode == "quit_to_desktop":
		emit_signal("confirmed_to_desktop")
	elif mode == "quit_to_main_menu":
		emit_signal("confirmed_to_main_menu")
	pass # Replace with function body.

func _on_no_pressed():
	hide()
	pass # Replace with function body.
