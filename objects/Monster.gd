extends Node3D

@export var monster_speed: float = 1

func _process(delta: float) -> void:
	position.z -= monster_speed * delta
