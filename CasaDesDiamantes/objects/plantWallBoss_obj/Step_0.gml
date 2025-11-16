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
			if (!frozen) {
				attackTimer -= global.dt;
				attackTimer2 -= global.dt;
			} else {
				attackTimer -= global.dt / 2;
				attackTimer2 -= global.dt / 2;
			}	
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
				instance_destroy(vines_obj);
				if (instance_exists(springladder_obj)) {
					spring = instance_nearest(x, y, springladder_obj);
					spring.open = true;
				}				
				instance_destroy();
			}
		}
	}
}

//Sound Position
audio_emitter_position(emitter, x, y, 0);

//Frozen
if (frozen) {
	image_blend = make_color_rgb(120, 120, 255);
	
	//Icecicle Shot
	if (global.dualBarettasUpgrade2) {
		icecicleAttackTimer -= global.dt;
		if (icecicleAttackTimer < 0) {
			audio_play_sound_on(emitter, icecicleShot_snd, false, false);
			icecicle = instance_create_layer(x + random_range(-156, 156), y, "Instances", icecicle_obj);
			icecicle.dir = random_range(270, 359);
			icecicleAttackTimer = 200 + random_range(-30, 30);
		}
	}
} else {
	if (!damageTint && !attackTint) {
		image_blend = c_white;
	}
}

if (freezeRes <= 0) {
	frozen = true;
}

//Particle System
part_emitter_region(global.partSystem, partEmitter, x - 156, x + 156, y - 18, y + 26, ps_shape_ellipse, ps_distr_invgaussian);

//Burnt
if (burnt) {
	image_blend = make_color_rgb(255, 144, 0);
	burnTimer -= global.dt;
	if (burnTimer < 0) {
		part_emitter_burst(global.partSystem, partEmitter, global.flameSparkPart, 19);
		damageTint = true;
		hp -= 1 / damageRes;
		aggro = true;
		bloodSpread = instance_create_layer(x, y, "Instances", bloodSpread_obj);
		bloodSpread.image_angle = random_range(0, 359);
		bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
		bloodSpread2.image_angle = random_range(0, 359);	
		audio_play_sound(bulletHit_snd, 1, false);
		burnTimer = burnTimerSave;
	}
}

if (burnRes <= 0) {
	burnt = true;
}