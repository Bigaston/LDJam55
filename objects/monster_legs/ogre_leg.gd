extends MonsterLegs

@export var basic_texture: Texture2D

func equip():
	texture = basic_texture
	#$AnimationPlayer.play("Walk")
	
func unequip():
	$AnimationPlayer.stop()

func set_monster_walking(walking: bool):
	if walking:
		$AnimationPlayer.play("Walk")
	else:
		$AnimationPlayer.stop()
		texture = basic_texture
