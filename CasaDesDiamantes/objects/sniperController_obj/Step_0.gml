if (enableShooting && !player_obj.deathActivated)
{
	if (!positionCrosshair)
	{
		sniperPosX = sniperTarget.x + random_range(-64, 64);
		sniperPosY = sniperTarget.y + random_range(-64, 64);
		positionCrosshair = true;
	}
	shootDelay -= global.dt;
	
	if (shootDelay < 100)
	{
		if (!audio_is_playing(bucketHit_snd))
		{
			audio_play_sound(bucketHit_snd, 1, false);
		}
	}

	if (shootDelay < 0)
	{
		var pistolShot = audio_play_sound(pistolShot_snd, 1, false);
		audio_sound_pitch(pistolShot, random_range(0.9, 1.1));
		screenshake(50, 20, 0.5, id);
	
		shootDelay = shootDelaySave + random_range(-50, 50);
		
		//Hit Player
		if (sniperPosX < sniperTarget.x + 6 && sniperPosX > sniperTarget.x - 6 && 
		sniperPosY < sniperTarget.y + 16 && sniperPosY > sniperTarget.y - 6)
		{
			if (!player_obj.isZombie && !player_obj.invincible && !player_obj.damageRecieved)
			{
				player_obj.hpOld = player_obj.hp;
				player_obj.hp -= damage;
				player_obj.damageRecieved = true;
				player_obj.damageCooldown = player_obj.damageCooldownSave;
				camera_obj.hitVignette = true;
			}
		}
	}
	
	if (sniperPosX > sniperTarget.x + 2)
	{
		sniperPosX -= global.dt / 2;
	}
	else if (sniperPosX < sniperTarget.x - 2)
	{
		sniperPosX += global.dt / 2;
	}
	else
	{
		sniperPosX = sniperTarget.x;
	}

	if (sniperPosY > sniperTarget.y + 2)
	{
		sniperPosY -= global.dt / 1.5;
	}
	else if (sniperPosY < sniperTarget.y - 2)
	{
		sniperPosY += global.dt / 1.5;
	}
	else
	{
		sniperPosY = sniperTarget.y;
	}
}

if (instance_exists(player_obj))
{
	with (player_obj)
	{
		if (place_meeting(x, y, sniperZone_obj))
		{
			sniperController_obj.enableShooting = true;
		}
		else
		{
			sniperController_obj.enableShooting = false;
			sniperController_obj.positionCrosshair = false;
			sniperController_obj.shootDelay = 700;
		}
	}
}