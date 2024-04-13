extends Node3D

@export var terrain_scene: PackedScene
@export var player: CharacterBody3D

var terrain_array: Array[Node3D]

func spawn_couloir(nb_to_spawn: int):
	for i in range(nb_to_spawn):
		var terrain = terrain_scene.instantiate() as Node3D
		
		var pos_z = -10 if (terrain_array.size() == 0) else (terrain_array[terrain_array.size() - 1].position.z - 20)
		
		terrain.position.z = pos_z
		
		add_child(terrain)
		terrain_array.push_back(terrain)
		
func dispawn_couloir(nb_to_dispawn: int):
	for i in range(nb_to_dispawn):
		var node = terrain_array.pop_front()
		node.queue_free()

func _ready():
	spawn_couloir(3)

func _process(delta: float) -> void:
	if player.position.z <= terrain_array[terrain_array.size()-1].position.z + 5:
		spawn_couloir(1)
		dispawn_couloir(1)
