extends Node3D

var monster: Node3D
var player: CharacterBody3D

func _on_intro_monster_spawned(pMonster: Node3D) -> void:
	monster = pMonster

func _on_intro_player_spawned(pSpawned: CharacterBody3D) -> void:
	player = pSpawned
	
	$TerrainContainer.player = player
	
	player.spell_used.connect(_on_spell_casted)

func _on_spell_casted(spell):
	if spell is BasicSpell:
		monster.use_basic_spell(spell)
	elif spell is FinalSpell:
		monster.use_final_spell(spell)
