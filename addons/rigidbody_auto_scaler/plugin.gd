@tool
extends EditorPlugin

const NAME = "RigidBodyAutoScaler"
const SCRIPT = "res://addons/rigidbody_auto_scaler/RigidBodyAutoScaler.gd"

func _enter_tree() -> void:
	add_autoload_singleton(NAME, SCRIPT)

func _exit_tree() -> void:
	remove_autoload_singleton(NAME)
