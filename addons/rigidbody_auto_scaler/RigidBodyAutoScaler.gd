extends Node


func _enter_tree() -> void:
	get_tree().node_added.connect(_perform)


func _exit_tree() -> void:
	get_tree().node_added.disconnect(_perform)


func _perform(node: Node):
	if node is RigidBody2D:
		_scale_2d(node)
	elif node is RigidBody3D:
		_scale_3d(node)


func _scale_2d(body: RigidBody2D):
	# If the node has a scale of 1, there's nothing for us to do.
	if body.global_scale.x == 1: return

	# Apply scale to all children before we reset it
	for child in body.get_children():
		if child is Node2D:
			child.scale *= body.global_scale

	# Reset the rigidbody's scale to 1
	body.global_scale = Vector2.ONE


func _scale_3d(body: RigidBody3D):
	# If the node has a scale of 1, there's nothing for us to do.
	body.top_level = true
	if body.scale.x == 1: return

	# Apply scale to all children before we reset it
	for child in body.get_children():
		if child is Node3D or child is Node2D:
			child.scale *= body.scale

	# Reset the rigidbody's scale to 1
	body.scale = Vector3.ONE
