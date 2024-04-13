extends Resource
class_name BasicSpell

@export var name: String
@export var condition: PartSpecification

@export_category("Result")
@export var result_true: PartSpecification
@export var result_false: PartSpecification
