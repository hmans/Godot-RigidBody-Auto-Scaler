extends Node


func _enter_tree() -> void:
	get_tree().node_added.connect(_perform)


func _exit_tree() -> void:
	get_tree().node_added.disconnect(_perform)


func _perform(node: Node):
	if node is RigidBody2D or node is RigidBody3D:
		# If the node has a scale of 1, there's nothing for us to do.
		if node.scale.x == 1: return

		# Apply scale to all children before we reset it
		for child in node.get_children():
			if child is Node3D or child is Node2D:
				child.scale *= node.scale

		# Reset the rigidbody's scale to 1
		if node is RigidBody3D:
			node.scale = Vector3.ONE
		else:
			node.scale = Vector2.ONE
