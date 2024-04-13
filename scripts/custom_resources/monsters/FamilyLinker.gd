extends Resource
class_name FamilyLinker

@export var family: CustomTypes.MonsterFamily

@export var icon: Texture2D

@export_category("Parts")
@export var heads: Array[Texture2D] = []
@export var torso: Array[Texture2D] = []
@export var arms: Array[Texture2D] = []
@export var legs: Array[Texture2D] = []

func get_random(part: CustomTypes.BodyPart) -> Texture2D:
	match part:
		CustomTypes.BodyPart.ARM:
			return arms.pick_random()
		CustomTypes.BodyPart.HEAD:
			return heads.pick_random()
		CustomTypes.BodyPart.LEGS:
			return legs.pick_random()
		CustomTypes.BodyPart.TORSO:
			return torso.pick_random()
			
	return PlaceholderTexture2D.new()
