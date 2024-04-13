extends Node3D

@export var monster_speed: float = 1
@export var monster_linker: MonsterResourceLinker

var parts: Dictionary = {}

func _ready():
	random_part(CustomTypes.BodyPart.HEAD, $Body/Head)
	random_part(CustomTypes.BodyPart.ARM, $Body/Arms)
	random_part(CustomTypes.BodyPart.TORSO, $Body/Torso)
	random_part(CustomTypes.BodyPart.LEGS, $Body/Legs)
	
func _process(delta: float) -> void:
	position.z -= monster_speed * delta

func random_part(part: CustomTypes.BodyPart, sprite: Sprite3D):
	var family = CustomTypes.MonsterFamily.values()[ randi()%CustomTypes.MonsterFamily.size() ]

	parts[part] = family

	var linker = monster_linker.get_family(family)
	
	var texture = linker.get_random(part)
	
	sprite.texture = texture
