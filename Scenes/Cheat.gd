extends Button
signal cheat_enabled(is_enabled:bool)
var cheat = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():	
	emit_signal("cheat_enabled", cheat)
