extends Node3D

@export var monster_scene: PackedScene
@export var monster_spawn: Node3D

@export var player_scene: PackedScene
@export var player_spawn: Node3D

@export var skip_intro: bool = false

signal monster_spawned(monster: Node3D)
signal player_spawned(player: CharacterBody3D)

var monster: Node3D
var player: CharacterBody3D

func _ready():
	if skip_intro:
		($AnimationPlayer as AnimationPlayer).speed_scale = 1000
		($AnimationPlayer as AnimationPlayer).play("StartGame", 1)

func _process(delta: float) -> void:
	if Input.is_action_just_released("use_spell"):
		($AnimationPlayer as AnimationPlayer).play("StartGame", 1)

func spawn_monster():
	monster = monster_scene.instantiate() as Node3D
	
	get_parent().add_child(monster)
	monster.global_position = monster_spawn.global_position
	
	monster_spawned.emit(monster)

func spawn_player():
	player = player_scene.instantiate() as CharacterBody3D
	
	get_parent().add_child(player)
	player.global_position = player_spawn.global_position
	player.global_rotation = player_spawn.global_rotation
	
	monster.trigger_move()
	
	player_spawned.emit(player)
	
	queue_free()
