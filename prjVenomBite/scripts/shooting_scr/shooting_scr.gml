if (argument0 == "pistol")
{
	if (global.pistolAmmo > 0)
	{
		var pistolShot = audio_play_sound(pistolShot_snd, 1, false);
		audio_sound_pitch(pistolShot, random_range(0.9, 1.1));
		
		var shotLightx = x + lengthdir_x(24, dirCursor);
		var shotLighty = y - 8 + lengthdir_y(24, dirCursor);
		instance_create_layer(playerBulletLine_obj.x, playerBulletLine_obj.y, "Instances", bulletPistol_obj);
		instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", shotLightPistol_obj);
		instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", smokecloud_obj);
		
		if (!huggingWall)
		{
			if (!isDashing)
			{
				if (image_xscale == 1)
				{
					horspeed = -0.75;
				}
				else
				{
					horspeed = 0.75;
				}
			}
		}
		global.pistolAmmo--;
		global.pistolCooldown = global.pistolCooldownSave;
		shotZoom = true;
	}
}

if (argument0 == "dualBarettas")
{
	if (global.dualBarettasAmmo > 0)
	{
		var barettaShot = audio_play_sound(dualBarettasShot_snd, 1, false);
		audio_sound_pitch(barettaShot, random_range(0.9, 1.1));
		
		var shotLightx = x + lengthdir_x(24, dirCursor);
		var shotLighty = y - 8 + lengthdir_y(24, dirCursor);
		instance_create_layer(playerBulletLine_obj.x, playerBulletLine_obj.y, "Instances", bulletDualBarettas_obj);
		instance_create_layer(playerBulletLine_obj.x - 2, playerBulletLine_obj.y - 4, "Instances", bulletDualBarettas_obj);
		instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", shotLightDualBarettas_obj);
		instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", smokecloud_obj);
		instance_create_layer(shotLightx - 2, shotLighty - 4, "ForegroundObjects", shotLightDualBarettas_obj);
		instance_create_layer(shotLightx - 2, shotLighty - 4, "ForegroundObjects", smokecloud_obj);
		
		if (!huggingWall)
		{
			if (!isDashing)
			{
				if (image_xscale == 1)
				{
					horspeed = -1.15;
				}
				else
				{
					horspeed = 1.15;
				}
			}
		}
		global.dualBarettasAmmo--;
		global.dualBarettasCooldown = global.dualBarettasCooldownSave;
		shotZoom = true;
	}
}

if (argument0 == "shotgun")
{
	if (global.shotgunAmmo > 0)
	{
		var shotgunShot = audio_play_sound(shotgunShot_snd, 1, false);
		audio_sound_pitch(shotgunShot, random_range(0.9, 1.1));		
		
		var shotLightx = x + lengthdir_x(24, dirCursor);
		var shotLighty = y - 8 + lengthdir_y(24, dirCursor);
		repeat (10)
		{
			instance_create_layer(playerBulletLine_obj.x, playerBulletLine_obj.y, "Instances", bulletShotgun_obj);
		}
		instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", shotLightShotgun_obj);
		instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", smokecloud_obj);
		
		if (!huggingWall)
		{
			if (dirCursor > 310 || dirCursor < 50)
			{
				horspeed -= shotJumpStrength / 3;
			}
			else if (dirCursor > 130 && dirCursor < 230)
			{
				horspeed += shotJumpStrength / 3;
			}
			else if (image_xscale == 1)
			{
				horspeed -= shotJumpStrength / 6;
			}
			else
			{
				horspeed += shotJumpStrength / 6;
			}
		}
		global.shotgunAmmo--;
		global.shotgunCooldown = global.shotgunCooldownSave;
		shotZoom = true;
		
		if (dirCursor > 205 && dirCursor < 340)
		{
			verspeed = -shotJumpStrength / 2;
		}
	}
}