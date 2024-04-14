extends Node3D

@export var monster_speed: float = 1
@export var monster_linker: MonsterResourceLinker
@export var time_before_start: float = 3

var is_going = false

var parts: Dictionary = {}

@onready var part_association: Dictionary = {
	CustomTypes.BodyPart.HEAD: {
		"sprite": $Body/Head,
		"audio": $Audio/HeadAudio
	},
	CustomTypes.BodyPart.ARM: {
		"sprite": $Body/Arms,
		"audio": $Audio/ArmsAudio
	},
	CustomTypes.BodyPart.TORSO: {
		"sprite": $Body/Torso,
		"audio": $Audio/TorsoAudio
	},
	CustomTypes.BodyPart.LEGS: {
		"sprite": $Body/Legs,
		"audio": $Audio/LegsAudio
	}
}

func _ready():
	random_part(CustomTypes.BodyPart.HEAD)
	random_part(CustomTypes.BodyPart.ARM)
	random_part(CustomTypes.BodyPart.TORSO)
	random_part(CustomTypes.BodyPart.LEGS)
	
func _process(delta: float) -> void:
	if is_going:
		position.z -= monster_speed * delta

func random_part(part: CustomTypes.BodyPart):
	var family = CustomTypes.MonsterFamily.values()[ randi()%CustomTypes.MonsterFamily.size()]
	
	set_body_part(part, family)

func set_body_part(part: CustomTypes.BodyPart, family: CustomTypes.MonsterFamily):
	parts[part] = family

	var linker = monster_linker.get_family(family)
	var texture = linker.get_random(part)
	
	part_association[part].sprite.texture = texture
	part_association[part].audio.stream = linker.get_audio(part)

func trigger_move():
	get_tree().create_timer(time_before_start).timeout.connect(func():
		is_going = true
	)

func use_basic_spell(spell: BasicSpell):
	if parts[spell.condition.body_position] == spell.condition.monster_family:
		set_body_part(spell.result_true.body_position, spell.result_true.monster_family)
	else:
		set_body_part(spell.result_false.body_position, spell.result_false.monster_family)
	
func use_final_spell(spell: FinalSpell):
	if (parts[CustomTypes.BodyPart.HEAD] == spell.head_family &&
		parts[CustomTypes.BodyPart.TORSO] == spell.torso_family &&
		parts[CustomTypes.BodyPart.ARM] == spell.arm_family &&
		parts[CustomTypes.BodyPart.LEGS] == spell.leg_family):

		print("ET C'EST GAGNE")
	else:
		var part = CustomTypes.BodyPart.values()[randi_range(1, 3)]
		random_part(part)
