extends CharacterBody2D

const SPEED = 300.0

@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		if direction.x < 0:
			_animated_sprite.play("left_walk")
		elif direction.x > 0:
			_animated_sprite.play("right_walk")
		else:
			pass
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		_animated_sprite.play("idle")

	move_and_slide()


func _on_button_pressed() -> void:
	pass # Replace with function body.
