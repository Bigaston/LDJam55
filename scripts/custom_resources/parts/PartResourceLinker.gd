extends Resource
class_name PartResourceLinker

@export var parts: Array[PartIconLink] = []

func get_icon(part_type: CustomTypes.BodyPart) -> PartIconLink:
	for part in parts:
		if part.part == part_type:
			return part
			
	return null
