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
		image_index = 1;
		fakegroundDestroyTimer -= global.dt;
		if (fakegroundDestroyTimer < 0) {
			with (fakeForestGroundPlantBoss_obj) {
				falling = true;
			}
		}
	}
}
/*###############################################*/
if (startBattle2) {
	if (damageTintTimer < 0)
	{
		damageTintTimer = damageTintTimerSave;
		damageTint = false;
	}

	attackTimer3 -= global.dt;
	attackTimer4 -= global.dt;

	if (attackTimer3 < 0) {
		with (plantBossVineSpawner2_obj) {
			spawnVine = true;
		}
		attackTimer3 = attackTimerSave3;
	}
	
	if (attackTimer4 < 0) {
		randNum = choose(4,6);
		repeat (randNum) {
			var damageOrb = instance_create_layer(x, y, "ForegroundObjects", damageOrb_obj);
			damageOrb.speedX = choose(random_range(-1.6, -0.6), random_range(1.6, 0.6));
			damageOrb.speedY = choose(random_range(-1.6, -0.6), random_range(1.6, 0.6));
		}
		attackTint = false;
		attackTintTimer = attackTintTimerSave;
		attackTintDelay = -1;
		attackTimer4 = attackTimerSave4;
	}
	
	//Attack Flash
	if (attackTimer4 < 100) {
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
	
	//Destroy after Phase 2
	if (hp < 1 && place_meeting(x, y, plantBossMoveCollider_obj)) {
		explosionTimer -= global.dt;
		deathTimer -= global.dt;
		
		if (explosionTimer < 0) {
			expl = instance_create_layer(x + random_range(128, -128), y + random_range(48, -48), "ForegroundObjects", explosion_obj);
			expl.damage = 0;
			var randDrop = choose(1,2,3,4,5,6);
			
			switch (randDrop) 
			{
				case 1:
					instance_create_layer(x + random_range(32, -32), y + random_range(32, -32), "ForegroundObjects", chipBluePickup_obj);
				break;
				case 2:
					instance_create_layer(x + random_range(32, -32), y + random_range(32, -32), "ForegroundObjects", chipBluePickup_obj);
				break;
				case 3:
					instance_create_layer(x + random_range(32, -32), y + random_range(32, -32), "ForegroundObjects", chipBluePickup_obj);
				break;
				case 4:
					instance_create_layer(x + random_range(32, -32), y + random_range(32, -32), "ForegroundObjects", chipRedPickup_obj);
				break;
				case 5:
					instance_create_layer(x + random_range(32, -32), y + random_range(32, -32), "ForegroundObjects", chipRedPickup_obj);
				break;
				case 6:
					instance_create_layer(x + random_range(32, -32), y + random_range(32, -32), "ForegroundObjects", chipVioletPickup_obj);
				break;
			}
			explosionTimer = explosionTimerSave;
		}
		
		if (deathTimer < 0) {
			instance_destroy();
			instance_destroy(plantBossBackground_obj);
		}
	}
}

if (moveToSecondFloor) {
	if (!place_meeting(x, y, plantBossMoveCollider_obj)) {
		y += global.dt / 1.5;
	} else {
		startBattle2 = true;
	}
}