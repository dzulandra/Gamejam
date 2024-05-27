extends Control
class_name SplashScreen

@export var time :float = 4
@export var exit :float = 1

signal finished

func _start():
	modulate.a = 0
	show()
	var tween: Tween = create_tween()
	tween.connect("finished", _finish)
	tween.tween_property(self, "modulate:a", 1, exit)
	tween.tween_interval(time)
	tween.tween_property(self, "modulate:a", 0, exit)
	
func _finish():
	emit_signal("finished")
	queue_free()
