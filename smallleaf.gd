extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _on_mouse_entered() -> void:
	sprite.play("default")
	
func _on_mouse_exited() -> void:
	sprite.stop()
