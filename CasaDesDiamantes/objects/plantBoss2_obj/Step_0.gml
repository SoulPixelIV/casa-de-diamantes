if (startBattle) {
	if (damageTintTimer < 0)
	{
		damageTintTimer = damageTintTimerSave;
		damageTint = false;
	}

	attackTimer -= global.dt;
	attackTimer2 -= global.dt;

	if (attackTimer < 0) {
		with (plantBossVineSpawner_obj) {
			spawnVine = true;
		}
		attackTimer = attackTimerSave;
	}
	
	if (attackTimer2 < 0) {
		randNum = choose(4,6);
		repeat (randNum) {
			var damageOrb = instance_create_layer(x, y, "ForegroundObjects", damageOrb_obj);
			damageOrb.speedX = choose(random_range(-1.6, -0.6), random_range(1.6, 0.6));
			damageOrb.speedY = choose(random_range(-1.6, -0.6), random_range(1.6, 0.6));
		}
		attackTint = false;
		attackTintTimer = attackTintTimerSave;
		attackTintDelay = -1;
		attackTimer2 = attackTimer2Save;
	}
	
	//Attack Flash
	if (attackTimer2 < 100) {
		attackTintTimer -= global.dt;
		if (attackTintTimer > 0) {
			attackTint = true;
			attackTintDelay = attackTintDelaySave;
		}
		if (attackTintTimer < 0) {
			attackTint = false;
			attackTintDelay -= global.dt;
		}
		
		if (attackTintDelay < 0) {
			attackTintTimer = attackTintTimerSave;
		}
	}
	
	//Destroy Ground after Phase 1
	if (hp < 1) {
		fakegroundDestroyTimer -= global.dt;
		if (fakegroundDestroyTimer < 0) {
			with (fakeForestGroundPlantBoss_obj) {
				falling = true;
			}
		}
	}
}

if (getVisible) {
	image_alpha += global.dt / 1000;
}