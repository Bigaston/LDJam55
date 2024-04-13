extends Control

func set_spell(spell: FinalSpell):
	$SpellName.text = spell.name
	
	$LeftText.text = spell.left_page_text
	$RightText.text = spell.right_page_text
