if (startBattle) {
	if (damageTintTimer < 0)
	{
		damageTintTimer = damageTintTimerSave;
		damageTint = false;
	}

	if (hp > 0) {
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
	}
	
	if (hp < 1) {
		explosionTimer -= global.dt;
		deathTimer -= global.dt;
		dropTimer -= global.dt;
		
		if (dropTimer < 0) {
			var randDrop = choose(1,2,3,4,5,6);
			
			switch (randDrop) 
			{
				case 1:
					instance_create_layer(x + random_range(64, -64), y + random_range(64, -64), "ForegroundObjects", chipBluePickup_obj);
				break;
				case 2:
					instance_create_layer(x + random_range(64, -64), y + random_range(64, -64), "ForegroundObjects", chipBluePickup_obj);
				break;
				case 3:
					instance_create_layer(x + random_range(64, -64), y + random_range(64, -64), "ForegroundObjects", chipBluePickup_obj);
				break;
				case 4:
					instance_create_layer(x + random_range(64, -64), y + random_range(64, -64), "ForegroundObjects", chipRedPickup_obj);
				break;
				case 5:
					instance_create_layer(x + random_range(64, -64), y + random_range(64, -64), "ForegroundObjects", chipRedPickup_obj);
				break;
				case 6:
					instance_create_layer(x + random_range(64, -64), y + random_range(64, -64), "ForegroundObjects", chipVioletPickup_obj);
				break;
			}
			dropTimer = dropTimerSave;
		}
		
		if (explosionTimer < 0) {
			expl = instance_create_layer(x + random_range(128, -128), y + random_range(48, -48), "ForegroundObjects", explosionTiny_obj);
			expl.damage = 0;
			expl.knockback = 0;
			expl.createLight = false;
			explosionTimer = explosionTimerSave;
		}
		
		if (deathTimer < 0) {
			image_alpha -= global.dt / 15;
			
			if (image_alpha < 0.05) {
				instance_destroy();
				instance_destroy(plantBossBackground_obj);
				instance_destroy(plantBossBackground2_obj);
				instance_destroy(plantBossBackgroundRing_obj);
				for (var i = 0; i < instance_number(zombieGirl_obj); i++) {
					var enemy = instance_find(zombieGirl_obj, i);
					if (distance_to_object(enemy) < 512) {
						instance_destroy(enemy);
					}
				}
				for (var i = 0; i < instance_number(plantBossFlower_obj); i++) {
					var flower = instance_find(plantBossFlower_obj, i);
					if (instance_exists(flower)) {
						instance_destroy(flower);
					}
				}
			}
		}
	}
}