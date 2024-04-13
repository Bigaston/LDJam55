extends Control

@export var spells_resource: SpellBook
@export var closed_book: Control
@export var opened_book: Control

@export_category("Bobbing Multiplier")
@export var speed_multiplier: float = 10
@export var move_multiplier: float = 10

signal spell_used(spell)

var player_speed: float = 0

var bobbing_progress = 0

var initial_closed_book_position: Vector2
var initial_opened_book_position: Vector2

var is_book_open = false

var current_page = 0
var spells: Array[Resource] = []

func _ready():
	initial_closed_book_position = $ClosedBook.position
	initial_opened_book_position = $OpenedBook.position
	close_book()
	
	for final_spell in spells_resource.final_spell:
		spells.push_back(final_spell)
	
	for basic_spell in spells_resource.basic_spell:
		spells.push_back(basic_spell)
		
	open_page(0)

func _process(delta: float) -> void:
	bobbing_progress += delta * player_speed
	
	closed_book.position.x = initial_closed_book_position.x + sin(bobbing_progress) * move_multiplier
	closed_book.position.y = initial_closed_book_position.y + cos(bobbing_progress * 1.2) * move_multiplier
	
	opened_book.position.x = initial_opened_book_position.x + sin(bobbing_progress) * move_multiplier
	opened_book.position.y = initial_opened_book_position.y + cos(bobbing_progress * 1.2) * move_multiplier

	if Input.is_action_just_pressed("book_right"):
		if current_page < spells.size() - 1:
			current_page += 1
			
			open_page(current_page)
	
	if Input.is_action_just_pressed("book_left"):
		if current_page > 0:
			current_page -= 1
			
			open_page(current_page)
			
	if Input.is_action_just_pressed("use_spell"):
		if is_book_open:
			spell_used.emit(spells[current_page])

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
	
func open_page(page_index: int):
	var spell = spells[page_index]
	
	if spell is BasicSpell:
		$OpenedBook/BasicSpell.set_spell(spell)
		
		$OpenedBook/FinalSpell.visible = false
		$OpenedBook/BasicSpell.visible = true
		
	if spell is FinalSpell:
		$OpenedBook/FinalSpell.set_spell(spell)
		
		$OpenedBook/BasicSpell.visible = false
		$OpenedBook/FinalSpell.visible = true
