class_name RigidBodyScaler
extends Node

@export
var recalculate_mass := true

@export
var recalculate_inertia := true

@onready
var rb = get_parent()


func _ready():
	_apply_scale()

func _apply_scale():
	assert(rb is RigidBody2D or rb is RigidBody3D, "Parent must be a RigidBody2D or RigidBody3D")

	# Update mass and inertia
	var f = rb.scale.x * rb.scale.y * rb.scale.z

	if recalculate_mass:
		rb.mass *= f

	if recalculate_inertia:
		rb.inertia *= f

	# Transfer scale to all children
	for child in rb.get_children():
		if child is Node3D:
			child.scale *= rb.scale

	# Reset my own scale
	rb.scale = Vector3.ONE
