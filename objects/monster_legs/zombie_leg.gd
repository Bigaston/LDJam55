extends MonsterLegs
func equip():
	pass
	#$AnimationPlayer.play("Walk")
	
func unequip():
	$AnimationPlayer.stop()

func set_monster_walking(walking: bool):
	if walking:
		$AnimationPlayer.play("Walk")
	else:
		$AnimationPlayer.stop()
