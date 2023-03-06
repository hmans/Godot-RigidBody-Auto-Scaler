extends Node2D

@export var scene : PackedScene

func _on_timer_timeout() -> void:
	var instance = scene.instantiate() as Node2D
	instance.position.x += randi_range(-500, 500)
	instance.position.y += randi_range(-10, 10)

	instance.scale *= randf_range(0.5, 1.5)

	add_child(instance)
