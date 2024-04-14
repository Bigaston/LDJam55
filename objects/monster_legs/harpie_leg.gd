extends MonsterLegs

func equip():
	pass
	
func unequip():
	$AnimationPlayer.stop()

func set_monster_walking(walking: bool):
	if walking:
		$AnimationPlayer.play("Walk")
	else:
		$AnimationPlayer.stop()
