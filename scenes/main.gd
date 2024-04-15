extends Node

var current_scene: Node

var loading = false
var loaded_scene = ""

signal scene_loaded()

func _ready():
	#change_scene(preload("res://scenes/game/level.tscn").instantiate())
	change_scene(preload("res://scenes/other/boot_screen.tscn").instantiate())	

func _process(_delta):
	if loading:
		if ResourceLoader.load_threaded_get_status(loaded_scene) == ResourceLoader.THREAD_LOAD_LOADED:			
			scene_loaded.emit()
			loading = false
			
			current_scene.queue_free()
			
			var new_packed_scene = ResourceLoader.load_threaded_get(loaded_scene)
			
			change_scene(new_packed_scene.instantiate())

func change_scene(new_scene: Node):
	if current_scene != null:
		remove_child(current_scene)
		current_scene.queue_free()
		
	add_child(new_scene)
		
	current_scene = new_scene
	
func change_scene_async(new_scene_path: String):
	if loading:
		return
	
	var loading_screen = preload("res://scenes/other/loading.tscn").instantiate()
	
	add_child(loading_screen)
	
	if current_scene != null:
		remove_child(current_scene)
		current_scene.queue_free()

	current_scene = loading_screen
	
	ResourceLoader.load_threaded_request(new_scene_path)
	loading = true
	loaded_scene = new_scene_path
