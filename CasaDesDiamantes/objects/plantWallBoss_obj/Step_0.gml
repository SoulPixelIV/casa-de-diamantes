//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (startBattle) {
	if (damageTintTimer < 0)
	{
		damageTintTimer = damageTintTimerSave;
		damageTint = false;
	}

	if (hp > 0) {
		if (!global.pause) {
			attackTimer -= global.dt;
			attackTimer2 -= global.dt;
		}

		if (attackTimer < 0) {
			repeat(choose(3, 4)) {
				instance_create_layer(random_range(x - 256, x + 256), y + 130, "Instances", plantRootsWarning_obj);
			}
			tempVal = choose(1,2,3);
			if (tempVal == 1) {
				if (instance_exists(enemySpawnerBossArena_obj)) {
					with (enemySpawnerBossArena_obj) {
						open = true;
					}
				}
			}
			attackTimer = attackTimerSave;
		}
	
		if (attackTimer2 < 0) {
			if (instance_number(plantBossFlower2_obj) < 12) {
				flower = instance_create_layer(choose(random_range(x - 256, x - 350), random_range(x + 256, x + 350)), y + 12, "Instances", plantBossFlower2_obj);
				flower.image_angle = random_range(120, 160);
			}
			attackTimer2 = attackTimer2Save;
		}
	}
	
	if (hp < 1) {
		if (instance_exists(colliderBoss_obj)) {
			instance_destroy(colliderBoss_obj);
		}
		explosionTimer -= global.dt;
		deathTimer -= global.dt;
		dropTimer -= global.dt;
		
		if (dropTimer < 0) {
			var randDrop = choose(1,2,3,4,5,6);
			
			switch (randDrop) 
			{
				case 1:
					instance_create_layer(x + random_range(128, -128), y + random_range(64, -64), "ForegroundObjects", chipPlatinumPickup_obj);
				break;
				case 2:
					instance_create_layer(x + random_range(128, -128), y + random_range(64, -64), "ForegroundObjects", chipPlatinumPickup_obj);
				break;
				case 3:
					instance_create_layer(x + random_range(128, -128), y + random_range(64, -64), "ForegroundObjects", chipRedPickup_obj);
				break;
				case 4:
					instance_create_layer(x + random_range(128, -128), y + random_range(64, -64), "ForegroundObjects", chipVioletPickup_obj);
				break;
				case 5:
					instance_create_layer(x + random_range(128, -128), y + random_range(64, -64), "ForegroundObjects", chipVioletPickup_obj);
				break;
				case 6:
					instance_create_layer(x + random_range(128, -128), y + random_range(64, -64), "ForegroundObjects", chipVioletPickup_obj);
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
				instance_destroy(plantWallBossForeground_obj);
				instance_destroy(eye_obj);
				instance_destroy(mouth_obj);
				instance_destroy(vine_obj);
				if (instance_exists(springladder_obj)) {
					spring = instance_nearest(x, y, springladder_obj);
					spring.open = true;
				}				
				instance_destroy();
			}
		}
	}
}