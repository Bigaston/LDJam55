extends Control

func _on_animation_player_animation_finished(anim_name):
	get_node("/root/Main").change_scene_async("res://scenes/game/level.tscn")
