extends Resource
class_name FinalSpell

@export var name: String
@export var sound: AudioStream
@export var result: Texture2D

@export_category("Partie")
@export var head_family: CustomTypes.MonsterFamily
@export var arm_family: CustomTypes.MonsterFamily
@export var torso_family: CustomTypes.MonsterFamily
@export var leg_family: CustomTypes.MonsterFamily

@export_category("Lore")
@export_multiline var left_page_text: String
@export_multiline var right_page_text: String
