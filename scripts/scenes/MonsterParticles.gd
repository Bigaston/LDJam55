extends Node3D

func spawn_particle(part: CustomTypes.BodyPart):
	match part:
		CustomTypes.BodyPart.ARM:
			($SpellParticleArm as GPUParticles3D).emitting = true
			($SpellParticleArm2 as GPUParticles3D).emitting = true
		CustomTypes.BodyPart.HEAD:
			($SpellParticleHead as GPUParticles3D).emitting = true
		CustomTypes.BodyPart.LEGS:
			($SpellParticleLegs as GPUParticles3D).emitting = true
