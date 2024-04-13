extends Control

func set_spell(spell: BasicSpell):
	$SpellName.text = spell.name

	$RightText.text = spell.right_page_text
