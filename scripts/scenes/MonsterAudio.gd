extends Node3D

@export_subgroup("Head")
@export var head_min_time: float = 5
@export var head_max_time: float = 10

@export_subgroup("Torso")
@export var torso_min_time: float = 1
@export var torso_max_time: float = 3

var time_before_head = 0
var time_before_torso = 0

var is_finished = false

func _ready():
	time_before_head = randf_range(head_min_time, head_max_time)
	time_before_torso = randf_range(torso_min_time, torso_max_time)

func _process(delta: float) -> void:
	if is_finished:
		return
		
	time_before_head -= delta
	time_before_torso -= delta
	
	if time_before_head <= 0:
		$HeadAudio.play()
		
		time_before_head = randf_range(head_min_time, head_max_time)

	if time_before_torso <= 0:
		$TorsoAudio.play()

		time_before_torso = randf_range(torso_min_time, torso_max_time)
