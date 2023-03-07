extends Node2D

@export var prefabs : Array[PackedScene]

func _on_timer_timeout() -> void:
	var instance = prefabs.pick_random().instantiate() as Node2D
	instance.position.x += randi_range(-50, 50)
	instance.position.y += randi_range(-10, 10)

	instance.scale *= randf_range(0.5, 1.5)

	add_child(instance)
