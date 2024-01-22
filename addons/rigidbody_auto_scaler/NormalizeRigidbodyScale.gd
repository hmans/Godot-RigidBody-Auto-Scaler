@tool 
extends EditorScript

# Forces all selected objects to be PhysicsBodies
const STRICT = true

var scaler = RigidbodyAutoScaler.new()

func _run():
	var selections = EditorInterface.get_selection().get_selected_nodes()
	# ensure all selected nodes are rigidbodies before scaling is applied if in strict mode
	if STRICT:
		for node in selections:
			assert(node is PhysicsBody2D or node is PhysicsBody3D, "Not all selected nodes are PhysicsBodies")
	
	# apply scale to children
	for node in selections: 
		if node is PhysicsBody2D:
			scaler.scale_2d(node)
		elif node is PhysicsBody3D:
			scaler.scale_3d(node)