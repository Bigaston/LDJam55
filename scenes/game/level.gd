extends Node3D

var monster: Node3D
var player: CharacterBody3D

func _on_intro_monster_spawned(pMonster: Node3D) -> void:
	monster = pMonster
	
	monster.win_party.connect(_on_win_party)

func _on_intro_player_spawned(pSpawned: CharacterBody3D) -> void:
	player = pSpawned
	
	$TerrainContainer.player = player
	
	player.spell_used.connect(_on_spell_casted)
	player.force_win.connect(_on_force_win)

func _on_spell_casted(spell):
	if spell is BasicSpell:
		monster.use_basic_spell(spell)
	elif spell is FinalSpell:
		monster.use_final_spell(spell)
		
func _on_force_win(spell):
	monster.force_win(spell)

func _on_win_party(spell: FinalSpell):
	player.win_party(spell)
