extends Control

@export var monster_linker: MonsterResourceLinker

func set_spell(spell: FinalSpell):
	$SpellName.text = spell.name
	
	$LeftText.text = spell.left_page_text
	$RightText.text = spell.right_page_text
	
	$MonsterPreview/Head.texture = monster_linker.get_family(spell.head_family).get_random(CustomTypes.BodyPart.HEAD)
	$MonsterPreview/Arms.texture = monster_linker.get_family(spell.arm_family).get_random(CustomTypes.BodyPart.ARM)
	$MonsterPreview/Torso.texture = monster_linker.get_family(spell.torso_family).get_random(CustomTypes.BodyPart.TORSO)
	$MonsterPreview/Legs.texture = monster_linker.get_family(spell.leg_family).get_random(CustomTypes.BodyPart.LEGS)
