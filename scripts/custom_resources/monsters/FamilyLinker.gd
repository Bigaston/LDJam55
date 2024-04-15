extends Resource
class_name FamilyLinker

@export var family: CustomTypes.MonsterFamily

@export var icon: Texture2D

@export var legs_object: PackedScene

@export_subgroup("Parts")
@export var heads: Array[Texture2D] = []
@export var torso: Array[Texture2D] = []
@export var arms: Array[MonsterArm] = []
@export var legs: Array[Texture2D] = []

@export_subgroup("Audio")
@export var head_audio: AudioStream
@export var torso_audio: AudioStream
@export var arms_audio: AudioStream
@export var legs_audio: AudioStream

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
	
func get_random_arms() -> MonsterArm:
	return arms.pick_random()
	
func get_audio(part: CustomTypes.BodyPart) -> AudioStream:
	match part:
		CustomTypes.BodyPart.ARM:
			return arms_audio
		CustomTypes.BodyPart.HEAD:
			return head_audio
		CustomTypes.BodyPart.LEGS:
			return legs_audio
		CustomTypes.BodyPart.TORSO:
			return torso_audio
			
	return AudioStream.new()
