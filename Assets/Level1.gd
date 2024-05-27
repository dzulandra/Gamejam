extends Node2D
signal scene_change_complete

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Emit the signal to notify Player.gd about the scene change
func _on_Area2D_scene_change_complete():
	emit_signal("scene_change_complete")
