extends LineEdit
var player:Player

func _on_text_submitted(new_text):
	if new_text == "nyom speed":
		player.SPEED = 250
	
