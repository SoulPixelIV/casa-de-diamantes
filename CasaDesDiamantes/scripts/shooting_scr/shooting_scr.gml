function shooting_scr(argument0) {
	
	player_obj.dashroll = false;
	player_obj.crouchRollTimer = player_obj.crouchRollTimerSave;
	if (player_obj.crouchslide) {
		jump_scr();
	}
	
	if (player_obj.spin) {
		player_obj.jumpspinAim = true;
		player_obj.jumpspinAimTimer = player_obj.jumpspinAimTimerSave;
	}
	
	if (argument0 == "pistol")
	{
		var pistolShot = audio_play_sound(pistolShot_snd, 1, false);
		audio_sound_pitch(pistolShot, random_range(0.9, 1.1));
		
		var shotLightx = x + lengthdir_x(24, dirCursor);
		var shotLighty = y - 8 + lengthdir_y(24, dirCursor);
		
		instance_create_layer(playerBulletLine_obj.x, playerBulletLine_obj.y, "Instances", bulletPistol_obj);
		
		instance_create_layer(playerBulletLine_obj.x, playerBulletLine_obj.y, "Instances", pistolBulletCase_obj);
		
		instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", shotLightPistol_obj);
		if (!player_obj.dashroll) {
			instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", smokecloud_obj);
		}
		screenshake(30, 6, 0.4, id);
		
		if (!huggingWall)
		{
			if (dirCursor > 0 && dirCursor < 90)
			{
				horspeed -= shotJumpStrength / 16;
				if (!player_obj.grounded) {
					verspeed -= shotJumpStrength / 16;
				}
			}
			if (dirCursor < 180 && dirCursor > 90)
			{
				horspeed += shotJumpStrength / 16;
				if (!player_obj.grounded) {
					verspeed -= shotJumpStrength / 16;
				}
			}
			if (dirCursor > 180 && dirCursor < 270)
			{
				horspeed += shotJumpStrength / 16;
				if (!player_obj.grounded) {
					verspeed -= shotJumpStrength / 16;
				}
			}
			if (dirCursor < 360 && dirCursor > 270)
			{
				horspeed -= shotJumpStrength / 16;
				if (!player_obj.grounded) {
					verspeed -= shotJumpStrength / 16;
				}
			}
		}
		global.pistolCooldown = global.pistolCooldownSave;
		shotZoom = true;
		player_obj.startShotCooldown = true;
	}

	if (argument0 == "dualBarettas")
	{
		if (global.pistolAmmo > 0)
		{
			instance_create_layer(playerBulletLine_obj.x, playerBulletLine_obj.y, "Instances", bulletDualBarettasDuoSpawner_obj);
		
			var shotLightx = x + lengthdir_x(24, dirCursor);
			var shotLighty = y - 8 + lengthdir_y(24, dirCursor);
			
			instance_create_layer(playerBulletLine_obj.x, playerBulletLine_obj.y, "Instances", bulletDualBarettas_obj);
			instance_create_layer(playerBulletLine_obj.x - 2, playerBulletLine_obj.y - 4, "Instances", bulletDualBarettas_obj);
			
			instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", shotLightDualBarettas_obj);
			instance_create_layer(shotLightx - 2, shotLighty - 4, "ForegroundObjects", shotLightDualBarettas_obj);
			if (!player_obj.dashroll) {
				instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", smokecloud_obj);
				instance_create_layer(shotLightx - 2, shotLighty - 4, "ForegroundObjects", smokecloud_obj);
			}
			screenshake(30, 8, 0.4, id);
		
			if (!huggingWall)
			{
				if (dirCursor > 0 && dirCursor < 90)
				{
					horspeed -= shotJumpStrength / 14;
					if (!player_obj.grounded) {
						verspeed -= shotJumpStrength / 14;
					}
				}
				if (dirCursor < 180 && dirCursor > 90)
				{
					horspeed += shotJumpStrength / 14;
					if (!player_obj.grounded) {
						verspeed -= shotJumpStrength / 14;
					}
				}
				if (dirCursor > 180 && dirCursor < 270)
				{
					horspeed += shotJumpStrength / 14;
					if (!player_obj.grounded) {
						verspeed -= shotJumpStrength / 14;
					}
				}
				if (dirCursor < 360 && dirCursor > 270)
				{
					horspeed -= shotJumpStrength / 14;
					if (!player_obj.grounded) {
						verspeed -= shotJumpStrength / 14;
					}
				}
			}
			global.pistolAmmo--;
			global.dualBarettasCooldown = global.dualBarettasCooldownSave;
			shotZoom = true;
			player_obj.startShotCooldown = true;
		}
	}

	if (argument0 == "shotgun")
	{
		if (global.shotgunAmmo > 0)
		{
			//player_obj.horGrounded = false;
			var shotgunShot = audio_play_sound(shotgunShot_snd, 1, false);
			audio_sound_pitch(shotgunShot, random_range(0.9, 1.1));		
		
			var shotLightx = x + lengthdir_x(24, dirCursor);
			var shotLighty = y - 8 + lengthdir_y(24, dirCursor);
			repeat (10)
			{
				instance_create_layer(playerBulletLine_obj.x, playerBulletLine_obj.y, "Instances", bulletShotgun_obj);
			}
			
			instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", shotLightShotgun_obj);
			if (!player_obj.dashroll) {
				instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", smokecloud_obj);
			}
			screenshake(40, 18, 0.6, id);
		
			if (!huggingWall)
			{
				if (dirCursor > 0 && dirCursor < 90)
				{
					horspeed -= shotJumpStrength / 3.5;
					verspeed -= shotJumpStrength / 3.5;
				}
				if (dirCursor < 180 && dirCursor > 90)
				{
					horspeed += shotJumpStrength / 3.5;
					verspeed -= shotJumpStrength / 3.5;
				}
				if (dirCursor > 180 && dirCursor < 270)
				{
					horspeed += shotJumpStrength / 3.5;
					verspeed -= shotJumpStrength / 3.5;
				}
				if (dirCursor < 360 && dirCursor > 270)
				{
					horspeed -= shotJumpStrength / 3.5;
					verspeed -= shotJumpStrength / 3.5;
				}
			}
			global.shotgunAmmo--;
			global.shotgunCooldown = global.shotgunCooldownSave;
			shotZoom = true;
			player_obj.startShotCooldown = true;
		}
	}

	if (argument0 == "sniper")
	{
		var pistolShot = audio_play_sound(sniperShot_snd, 1, false);
		audio_sound_pitch(pistolShot, 2 - ((player_obj.sniperDamageValue / 100) / 5));
		
		var shotLightx = x + lengthdir_x(24, dirCursor);
		var shotLighty = y - 8 + lengthdir_y(24, dirCursor);
		instance_create_layer(playerBulletLine_obj.x, playerBulletLine_obj.y, "Instances", bulletSniper_obj);
		instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", shotLightShotgun_obj);
		instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", smokecloud_obj);
		screenshake(50, 12, 0.6, id);
		
		if (!huggingWall)
		{
			if (dirCursor > 0 && dirCursor < 90)
			{
				horspeed -= shotJumpStrength / 2.5;
				verspeed -= shotJumpStrength / 2.5;
			}
			if (dirCursor < 180 && dirCursor > 90)
			{
				horspeed += shotJumpStrength / 2.5;
				verspeed -= shotJumpStrength / 2.5;
			}
			if (dirCursor > 180 && dirCursor < 270)
			{
				horspeed += shotJumpStrength / 2.5;
				verspeed -= shotJumpStrength / 2.5;
			}
			if (dirCursor < 360 && dirCursor > 270)
			{
				horspeed -= shotJumpStrength / 2.5;
				verspeed -= shotJumpStrength / 2.5;
			}
		}
		global.sniperCooldown = global.sniperCooldownSave;
		shotZoom = true;
		player_obj.startShotCooldown = true;
	}
	
	if (argument0 == "bow")
	{
		//var pistolShot = audio_play_sound(bowShot_snd, 1, false);
		//audio_sound_pitch(pistolShot, 2 - ((player_obj.bowDamageValue / 100) / 5));
		screenshake(50, 3.5, 0.4, id);
		var bombarrow = instance_create_layer(playerBulletLine_obj.x, playerBulletLine_obj.y, "Instances", bombArrow_obj);
		bombarrow.horspeed = cos(degtorad(player_obj.dirCursor)) * (player_obj.bowReadyingImage * 6 + 6);
		bombarrow.verspeed = -sin(degtorad(player_obj.dirCursor)) * (player_obj.bowReadyingImage * 6 + 6);
		
		global.bowCooldown = global.bowCooldownSave;
		shotZoom = true;
		player_obj.startShotCooldown = true;
	}

	if (argument0 == "silencedMP")
	{		
		instance_create_layer(playerBulletLine_obj.x, playerBulletLine_obj.y, "Instances", bulletSilencedMPSalveSpawner_obj);
		
		if (!huggingWall)
		{
			if (dirCursor > 0 && dirCursor < 90)
			{
				horspeed -= shotJumpStrength / 16;
				if (!player_obj.grounded) {
					verspeed -= shotJumpStrength / 16;
				}
			}
			if (dirCursor < 180 && dirCursor > 90)
			{
				horspeed += shotJumpStrength / 16;
				if (!player_obj.grounded) {
					verspeed -= shotJumpStrength / 16;
				}
			}
			if (dirCursor > 180 && dirCursor < 270)
			{
				horspeed += shotJumpStrength / 16;
				if (!player_obj.grounded) {
					verspeed -= shotJumpStrength / 16;
				}
			}
			if (dirCursor < 360 && dirCursor > 270)
			{
				horspeed -= shotJumpStrength / 16;
				if (!player_obj.grounded) {
					verspeed -= shotJumpStrength / 16;
				}
			}
		}
		global.silencedMPCooldown = global.silencedMPCooldownSave;
		shotZoom = true;
		player_obj.startShotCooldown = true;
	}

}
