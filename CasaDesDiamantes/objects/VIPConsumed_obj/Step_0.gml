//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (damageTintTimer < 0)
{
	damageTintTimer = damageTintTimerSave;
	damageTint = false;
}
	
if (hp < 1) {
	if (instance_exists(col)) {
		instance_destroy(col);
	}
	explosionTimer -= global.dt;
	deathTimer -= global.dt;
	dropTimer -= global.dt;
		
	if (dropTimer < 0) {
		var randDrop = choose(1,2,3,4,5,6);
			
		/*
		switch (randDrop) 
		{
			case 1:
				instance_create_layer(x + random_range(32, -32), y + random_range(64, -32), "ForegroundObjects", chipPlatinumPickup_obj);
			break;
			case 2:
				instance_create_layer(x + random_range(32, -32), y + random_range(64, -32), "ForegroundObjects", chipPlatinumPickup_obj);
			break;
			case 3:
				instance_create_layer(x + random_range(32, -32), y + random_range(64, -32), "ForegroundObjects", chipRedPickup_obj);
			break;
			case 4:
				instance_create_layer(x + random_range(32, -32), y + random_range(64, -32), "ForegroundObjects", chipVioletPickup_obj);
			break;
			case 5:
				instance_create_layer(x + random_range(32, -32), y + random_range(64, -32), "ForegroundObjects", chipVioletPickup_obj);
			break;
			case 6:
				instance_create_layer(x + random_range(32, -32), y + random_range(64, -32), "ForegroundObjects", chipVioletPickup_obj);
			break;
		}*/
		dropTimer = dropTimerSave;
	}
		
	if (explosionTimer < 0) {
		expl = instance_create_layer(x + random_range(32, -32), y + random_range(48, -48), "ForegroundObjects", explosionTiny_obj);
		expl.damage = 0;
		expl.knockback = 0;
		expl.createLight = false;
		explosionTimer = explosionTimerSave;
	}
		
	if (deathTimer < 0) {
		image_alpha -= global.dt / 15;
			
		if (image_alpha < 0.05) {			
			instance_destroy();
		}
		
		for (var i = 0; i < instance_number(eye_obj); ++i;)
		{
		    eye[i] = instance_find(eye_obj,i);
			instance_destroy(eye[i]);
		}
	}
}

//Burnt
if (burnt) {
	image_blend = make_color_rgb(255, 144, 0);
	burnTimer -= global.dt;
	if (burnTimer < 0) {
		part_emitter_burst(global.partSystem, partEmitter, global.flameSparkPart, 19);
		damageTint = true;
		hp -= 0.5 / damageRes;
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

/// @description Check Player
if (instance_exists(player_obj) && !global.dialogueDelayStart) {
	if (distance_to_object(player_obj) < 100 && !global.pause && !dialogueTriggered)
	{
		global.dialogueDelayStart = true;
		dialogueSystem_obj.scene45 = true;
		player_obj.movement = false;
		camera_obj.drawBlackborders = true;
		dialogueTriggered = true;
	}
}