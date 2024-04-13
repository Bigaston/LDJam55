extends Control

@export var part_linker: PartResourceLinker
@export var monster_linker: MonsterResourceLinker

func set_spell(spell: BasicSpell):
	$SpellName.text = spell.name
	$RightText.text = spell.right_page_text

	$PictoPart.texture = part_linker.get_icon(spell.result_true.body_position)
	$PictoFamily.texture = monster_linker.get_family(spell.result_true.monster_family).icon
	
	$Condition/ConditionPart.texture = part_linker.get_icon(spell.condition.body_position)
	$Condition/ConditionFamily.texture = monster_linker.get_family(spell.condition.monster_family).icon

	$Condition/BadResultPart.texture = part_linker.get_icon(spell.result_false.body_position)
	$Condition/BadResultFamily.texture = monster_linker.get_family(spell.result_false.monster_family).icon
