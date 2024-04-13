extends CharacterBody3D

@export var speed: float = 5.0
@export var book: Control
@export var open_book_threeshold = -50

@export_category("Sensitivity")
@export var vertical_sensitivity = 0.01
@export var horizontal_sensitivity = 0.01

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var neck := $Neck
@onready var camera := $Neck/Camera3D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent):
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			rotate_y(-event.relative.x * horizontal_sensitivity)
			camera.rotate_x(-event.relative.y * vertical_sensitivity)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x
		velocity.z = direction.z
	else:
		velocity.x = 0.0
		velocity.z = 0.0
		
	velocity = velocity.normalized()
	velocity *= speed

	move_and_slide()

	book.player_speed = velocity.length()

func _process(_delta):
	if camera.rotation_degrees.x <= open_book_threeshold:
		book.open_book()
	else:
		book.close_book()
