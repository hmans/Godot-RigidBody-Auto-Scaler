extends Node


func _enter_tree() -> void:
	get_tree().node_added.connect(_perform)


func _exit_tree() -> void:
	get_tree().node_added.disconnect(_perform)


func _perform(node: Node):
	if node is RigidBody2D or node is RigidBody3D:
		# If the node has a scale of 1, there's nothing for us to do.
		if node.scale.x == 1: return

		# Update mass and inertia
		var f = node.scale.x * node.scale.y
		if node is RigidBody3D: f *= node.scale.z

		node.mass *= f
		node.inertia *= f

		# Apply scale to all children before we reset it
		for child in node.get_children():
			if child is Node3D:
				child.scale *= node.scale

		# Reset the rigidbody's scale to 1
		node.scale = Vector3.ONE
