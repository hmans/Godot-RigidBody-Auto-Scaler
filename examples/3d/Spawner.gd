extends Node3D

@export var prefabs : Array[PackedScene]




func _on_timer_timeout() -> void:
	var instance = prefabs.pick_random().instantiate() as Node3D
	instance.position.x += randf_range(-1, 1)
	instance.position.y += randf_range(-1, 1)
	instance.position.z += randf_range(-1, 1)

	instance.scale *= randf_range(0.5, 1.5)

	add_child(instance)


