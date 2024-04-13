extends Node3D

@export var monster_speed: float = 1
@export var monster_linker: MonsterResourceLinker
@export var time_before_start: float = 3

var is_going = false

var parts: Dictionary = {}

func _ready():
	random_part(CustomTypes.BodyPart.HEAD, $Body/Head, $Audio/HeadAudio)
	random_part(CustomTypes.BodyPart.ARM, $Body/Arms, $Audio/ArmsAudio)
	random_part(CustomTypes.BodyPart.TORSO, $Body/Torso, $Audio/TorsoAudio)
	random_part(CustomTypes.BodyPart.LEGS, $Body/Legs, $Audio/LegsAudio)
	
func _process(delta: float) -> void:
	if is_going:
		position.z -= monster_speed * delta

func random_part(part: CustomTypes.BodyPart, sprite: Sprite3D, audio: AudioStreamPlayer3D):
	var family = CustomTypes.MonsterFamily.values()[ randi()%CustomTypes.MonsterFamily.size() ]

	parts[part] = family

	var linker = monster_linker.get_family(family)
	var texture = linker.get_random(part)
	
	sprite.texture = texture
	audio.stream = linker.get_audio(part)

func trigger_move():
	get_tree().create_timer(time_before_start).timeout.connect(func():
		is_going = true
	)
