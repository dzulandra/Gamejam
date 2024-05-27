extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -400.0
var is_attacking = false
var health = 400

func get_input():
	var direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	if direction.x != 0:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction.y != 0:
		velocity.y = direction.y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if Input.is_action_just_pressed("attack"):
		perform_attack()

func perform_attack():
	if not is_attacking:
		is_attacking = true

func _physics_process(delta):
	get_input()
	move_and_slide()

func _process(delta):
	if velocity.x != 0 or velocity.y !=0:
		$AnimatedSprite2D.play("walk")
		if velocity.x > 0:
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true
	elif is_attacking:
		$AnimatedSprite2D.play("Attack")
	else :
		$AnimatedSprite2D.play("default")

func _on_animated_sprite_2d_animation_finished():
	is_attacking = false
