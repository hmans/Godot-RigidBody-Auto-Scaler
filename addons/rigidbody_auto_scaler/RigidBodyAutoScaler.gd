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
			child.transform.origin *= body.global_scale

	# Reset the rigidbody's scale to 1
	body.global_scale = Vector2.ONE


func _scale_3d(body: RigidBody3D):
	# First, we'll set this node to use "top level" mode. This basically
	# disconnects it from its parents transform3d (which a rigidbody3d would
	# do either way, because it's simulated in the physics world). It has the
	# added advantage of transferring the body's current world scale into
	# its own transform, so we can access it through body.scale (there is
	# no easy way to quickly get a node3d's world scale from a parented transform.)
	body.top_level = true

	# If the node has a scale of 1, there's nothing for us to do.
	if body.scale.x == 1: return

	# Apply scale to all children before we reset it
	for child in body.get_children():
		if child is Node3D:
			child.scale *= body.scale
			child.transform.origin *= body.scale

	# Reset the rigidbody's scale to 1
	body.scale = Vector3.ONE
