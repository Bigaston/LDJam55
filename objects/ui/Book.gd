extends Control

@export var closed_book: Control

@export_category("Bobbing Multiplier")
@export var speed_multiplier: float = 10
@export var move_multiplier: float = 10

var player_speed: float = 0

var bobbing_progress = 0

var initial_book_position: Vector2

func _ready():
	initial_book_position = $ClosedBook.position

func _process(delta: float) -> void:
	bobbing_progress += delta * player_speed
	
	closed_book.position.x = initial_book_position.x + sin(bobbing_progress) * move_multiplier
	closed_book.position.y = initial_book_position.y + cos(bobbing_progress * 1.2) * move_multiplier
