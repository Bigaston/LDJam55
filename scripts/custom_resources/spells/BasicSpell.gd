extends Resource
class_name BasicSpell

@export var name: String
@export var condition: PartSpecification
@export var sound: AudioStream

@export_category("Result")
@export var result_true: PartSpecification
@export var result_false: PartSpecification

@export_category("Lore")
@export var spell_image: Texture2D
@export_multiline var right_page_text: String
@export_multiline var left_page_text_1: String
@export_multiline var left_page_text_2: String
