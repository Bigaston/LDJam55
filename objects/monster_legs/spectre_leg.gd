extends Sprite3D

func equip():
	#$Sounds/Footstep.volume_db = -80
	$Sounds/Footstep.play()
	
	#$AnimationPlayer.play("FadeIn")

func unequip():
	$Sounds/Footstep.stop()

func set_monster_walking(walking: bool):
	pass
