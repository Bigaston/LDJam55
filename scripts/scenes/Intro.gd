extends Node3D

@export var monster_scene: PackedScene
@export var monster_spawn: Node3D

@export var player_scene: PackedScene
@export var player_spawn: Node3D

var monster: Node3D
var player: CharacterBody3D

func _process(delta: float) -> void:
	if Input.is_action_just_released("use_spell"):
		($AnimationPlayer as AnimationPlayer).play("StartGame", 1)

func spawn_monster():
	monster = monster_scene.instantiate() as Node3D
	
	get_parent().add_child(monster)
	monster.global_position = monster_spawn.global_position

func spawn_player():
	player = player_scene.instantiate() as CharacterBody3D
	
	get_parent().add_child(player)
	player.global_position = player_spawn.global_position
	player.global_rotation = player_spawn.global_rotation
	
	monster.trigger_move()
	
	queue_free()
