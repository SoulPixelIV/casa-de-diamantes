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
		}
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
	}
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;