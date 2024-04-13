extends Control

@export var spells: SpellBook
@export var closed_book: Control
@export var opened_book: Control

@export_category("Bobbing Multiplier")
@export var speed_multiplier: float = 10
@export var move_multiplier: float = 10

var player_speed: float = 0

var bobbing_progress = 0

var initial_closed_book_position: Vector2
var initial_opened_book_position: Vector2

var is_book_open = false

var current_page = 0

func _ready():
	initial_closed_book_position = $ClosedBook.position
	initial_opened_book_position = $OpenedBook.position
	close_book()

func _process(delta: float) -> void:
	bobbing_progress += delta * player_speed
	
	closed_book.position.x = initial_closed_book_position.x + sin(bobbing_progress) * move_multiplier
	closed_book.position.y = initial_closed_book_position.y + cos(bobbing_progress * 1.2) * move_multiplier
	
	opened_book.position.x = initial_opened_book_position.x + sin(bobbing_progress) * move_multiplier
	opened_book.position.y = initial_opened_book_position.y + cos(bobbing_progress * 1.2) * move_multiplier

func open_book():
	if !is_book_open:
		is_book_open = true
		closed_book.visible = false
		opened_book.visible = true
	
func close_book():
	if is_book_open:
		is_book_open = false
		closed_book.visible = true
		opened_book.visible = false
