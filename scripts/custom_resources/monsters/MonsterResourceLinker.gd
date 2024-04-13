extends Resource
class_name MonsterResourceLinker

@export var families: Array[FamilyLinker] = []

func get_family(family_type: CustomTypes.MonsterFamily) -> FamilyLinker:
	for family in families:
		if family.family == family_type:
			return family
			
	return null
