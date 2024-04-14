extends CharacterBody3D
class_name Player

@export var opened_book_speed: float = 3.0
@export var speed: float = 5.0
@export var book: Control
@export var open_book_threeshold = -50

@export_category("Sensitivity")
@export var vertical_sensitivity = 0.01
@export var horizontal_sensitivity = 0.01
@export var vertical_speed = 3
@export var horizontal_speed = 3

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var neck := $Neck
@onready var camera := $Neck/Camera3D

var can_restart = false
var can_move = true

signal spell_used(spell)

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent):
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			if !can_move:
				return
			rotate_y(-event.relative.x * horizontal_sensitivity)
			camera.rotate_x(-event.relative.y * vertical_sensitivity)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))

func _physics_process(delta):
	if !can_move:
		return
		
	if not is_on_floor():
		velocity.y -= gravity * delta

	var cam_left_right = Input.get_axis("cam_right", "cam_left")
	
	if cam_left_right:
		rotate_y(cam_left_right * delta * horizontal_speed)
		
	var cam_top_down = Input.get_axis("cam_down", "cam_up")
	
	if cam_top_down:
		camera.rotate_x(cam_top_down * delta * vertical_speed)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))

	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x
		velocity.z = direction.z
	else:
		velocity.x = 0.0
		velocity.z = 0.0
		
	velocity = velocity.normalized()
	
	if book.is_book_open:
		velocity *= opened_book_speed
	else:
		if input_dir.y > 0:
			velocity *= opened_book_speed
		else:
			velocity *= speed

	move_and_slide()

	book.player_speed = velocity.length()

func _process(_delta):
	if camera.rotation_degrees.x <= open_book_threeshold:
		book.open_book()
	else:
		book.close_book()
		
	if Input.is_action_just_released("use_spell") && can_restart:
		get_node("/root/Main").change_scene_async("res://scenes/game/level.tscn")

func _on_book_spell_used(spell: Variant) -> void:
	spell_used.emit(spell)

func kill_player():
	$AnimationPlayer.play("Death")
	can_move = false
	
func enable_restart():
	can_restart = true
