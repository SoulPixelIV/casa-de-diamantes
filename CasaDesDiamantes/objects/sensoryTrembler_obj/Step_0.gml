/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;

if (!gotSpawned)
{
	spawn = instance_create_layer(x, y, "Instances", enemyHiddenSpawnpoint_obj);
	spawn.hp = hp;
	spawn.aggroRange = aggroRange;
	spawn.spawnID = sensoryTrembler_obj;
	spawn.dir = image_xscale;
	gotSpawned = true;
}

if (instance_exists(player_obj))
{
	dirLookat = point_direction(x, y, player_obj.x, player_obj.y);
}
else
{
	dirLookat = 0;
}

//Sight Check
if (instance_exists(player_obj)) {
	if (!collision_line(x, y - 86, player_obj.x, player_obj.y, collider_obj, false, true) && !collision_line(x, y, player_obj.x, player_obj.y, enemyVisionBlockZone_obj, false, true))
	{
		if (collision_line(x, y, player_obj.x, player_obj.y, player_obj, false, true))
		{
			if (distance_to_point(player_obj.x, player_obj.y) < aggroRange)
			{
				deaggroTimer = deaggroTimerSave;
				aggroTimer -= global.dt;
			}
		}
		
		//Check if player is right behind enemy
		if (distance_to_point(player_obj.x, player_obj.y) < 64) {
			deaggroTimer = deaggroTimerSave;
			aggroTimer -= global.dt;
		}
	}
	else
	{
		aggroTimer = aggroTimerSave;
		deaggroTimer -= global.dt;
	}
}

//Base Rotation
if (baseRotation > 0.5)
{
	rotDir = 1;
}
if (baseRotation < -0.5)
{
	rotDir = 0;
}
if (rotDir == 0)
{
	if (attackInProg3)
	{
		baseRotation += global.dt / 8;
	}
	else
	{
		baseRotation += global.dt / 16;
	}
}
else
{
	if (attackInProg3)
	{
		baseRotation -= global.dt / 8;
	}
	else
	{
		baseRotation -= global.dt / 16;
	}
}
/*
if (deaggroTimer < 0)
{
	if (!place_meeting(x, y, battleArena_obj) && room != infiniteSpawn) {
		aggro = false;
		deaggroTimer = deaggroTimerSave;
	}
}*/
if (aggroTimer < 0)
{
	aggro = true;
	aggroTimer = aggroTimerSave;
}

if (movement && !attackInProg3)
{
	if (aggro && distance_to_object(player_obj) > 200 && distance_to_object(player_obj) < aggroRange)
	{
		if (instance_exists(hazard_obj))
		{
			if (!collision_circle(x, y, 64, hazard_obj, false, true))
			{
				if (player_obj.x > x)
				{
					horspeed = movSpeed;
				}
				else
				{
					horspeed = -movSpeed;
				}
			}
			else
			{
				hazard = instance_nearest(x, y, hazard_obj);
				if (hazard.x > x)
				{
					horspeed = -movSpeed / 2;
				}
				else
				{
					horspeed = movSpeed / 2;
				}
			}
		}
		else
		{
			if (player_obj.x > x)
			{
				horspeed = movSpeed;
			}
			else
			{
				horspeed = -movSpeed;
			}
		}
	}
	
	if (aggro)
	{
		if (distance_to_object(player_obj) < 200 && distance_to_object(player_obj) > 24)
		{
			randDirChangeTimer -= global.dt;
			if (randDirChangeTimer < 0)
			{
				randMovDir = choose(1, -1);
				randDirChangeTimer = randDirChangeTimerSave + random_range(-80, 80);
			}
			horspeed = movSpeed * randMovDir;
		}
	
		if (distance_to_object(player_obj) < 24)
		{
			horspeed = 0;
		}
	}
}
else
{
	if (!attackInProg)
	{
		horspeed = 0;
	}
}

//Gravity
if (verspeed < 2)
{
	verspeed -= gravityStrength * global.dt;
}
if (attackInProg)
{
	verspeed = 0;
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

//Collision
//horspeed
if (!place_free(x + (horspeed * global.dt), y))
{
	if (sign(horspeed) != 0)
	{
		while (place_free(x + sign(horspeed) / 100, y))
		{
			x += sign(horspeed) / 100;
		}
		horspeed = 0;
	}
}
//verspeed
if (!place_free(x, (y + (verspeed * global.dt))) + 76)
{
	if (sign(verspeed) != 0)
	{
		while (place_free(x, (y + sign(verspeed) / 100) + 64))
		{
			y += sign(verspeed) / 100;
		}
		verspeed = 0;
	}
}

//Player Collision
if (place_meeting(x + horspeed * global.dt, y, player_obj))
{
	if (player_obj.x > x)
	{
		horspeed = -movSpeed;
	}
	else
	{
		horspeed = movSpeed;
	}
}

//###OutsideSolid###
if (place_free(x, y))
{
    savePosX = x;
    savePosY = y;
}
else
{
    x = savePosX;
    y = savePosY;
    verSpeed = 0;
}

//Frozen
if (frozen) {
	movSpeed = movSpeedSave / 2;
	image_blend = make_color_rgb(120, 120, 255);
	
	//Icecicle Shot
	if (global.dualBarettasUpgrade2) {
		icecicleAttackTimer -= global.dt;
		if (icecicleAttackTimer < 0) {
			audio_play_sound_on(emitter, icecicleShot_snd, false, false);
			icecicle = instance_create_layer(x, y, "Instances", icecicle_obj);
			icecicle.dir = random_range(0, 359);
			icecicleAttackTimer = 200 + random_range(-30, 30);
		}
	}
} else {
	movSpeed = movSpeedSave;
	image_blend = c_white;
}

if (freezeRes <= 0) {
	frozen = true;
}

if (aggroAtSpecificPoint)
{
	var specificPoint = instance_nearest(x, y, battleArenaPlayerpoint_obj);
	var playerHitPoint = false
	with (player_obj)
	{
		if (place_meeting(x, y, specificPoint))
		{
			playerHitPoint = true;
		}
	}
	if (playerHitPoint)
	{
		aggro = true;
	}
}

//###Second phase###
if (hp < 100)
{
	explosionDelay -= global.dt;
	if (!secondPhase)
	{
		hitable = false;
		movSpeed = movSpeed * 1.5;
		secondPhase = true;
		instance_create_layer(x + 4, y - 100, "Instances", sensoryTremblerEyeHitbox_obj);
		/*
		alarmLight = instance_create_layer(x + 5, y - 94, "GraphicsLayer", spotlightRedIntense_obj); 
		with (alarmLight)
		{
			body = instance_nearest(x, y, sensoryTrembler_obj);
		}*/
		
		//Play sound
		alarmSnd = audio_play_sound_on(emitter, alarm_snd, true, 1);
	}
	if (explosionDelay < 0 && explosionCount < 10)
	{
		instance_create_layer(x + random_range(86, -86), y + random_range(0, -186), "ForegroundObjects", explosionTiny_obj);
		explosionDelay = random_range(4, 16);
		explosionCount++;
	}
}

//###Death###
if (eyeKilled)
{
	var deathCross = instance_create_layer(x, y - 8, "ForegroundObjects", deathCross_obj);
	
	if (instance_exists(alarmLight))
	{
		instance_destroy(alarmLight);
	}
	
	//Enemy Slowmo
	var randNum = choose(1,2,3,4,5,6,7,8,9);
	if (randNum == 9 || player_obj.forceSlowmo)
	{
		player_obj.enemySlowmo = true;
		player_obj.camFollowTarget = deathCross;
	}
	
	//Drop Item
	if (instance_exists(player_obj))
	{
		if (player_obj.hp < 30 || (player_obj.hp - player_obj.infection < 30))
		{
			if (player_obj.hp > 15)
			{
				repeat (2)
				{
					instance_create_layer(x, y, "Instances", healthSmall_obj);
				}
			}
			else
			{
				repeat (4)
				{
					instance_create_layer(x, y, "Instances", healthSmall_obj);
				}
			}
		}
	}
	
	//Drop Ammo
	if (lastBullet == bulletDualBarettas_obj)
	{
		if (global.unlockedWeapon[2])
		{
			repeat (ceil(ammoSpawnCount / 4))
			{
				instance_create_layer(x, y, "Instances", ammoShotgunSmall_obj);
			}
		}
	}
	if (lastBullet == bulletShotgun_obj)
	{
		if (global.unlockedWeapon[1])
		{
			repeat (ammoSpawnCount)
			{
				instance_create_layer(x, y, "Instances", ammoPistolSmall_obj);
			}
		}
	}
	if (lastBullet == bulletSilencedMP_obj)
	{
		if (global.unlockedWeapon[4])
		{
			repeat (ceil(ammoSpawnCount / 4))
			{
				instance_create_layer(x, y, "Instances", ammoSniperSmall_obj);
			}
		}
	}
	if (lastBullet == bulletSniper_obj)
	{
		if (global.unlockedWeapon[3])
		{
			repeat (ceil(ammoSpawnCount / 2))
			{
				instance_create_layer(x, y, "Instances", ammoSilencedMPSmall_obj);
			}
		}
	}

	//Drop Money
	var maxAmount = random_range(moneyDropMin, moneyDropMax);
	for (i = 0; i < maxAmount; i++)
	{
		chip = choose(1,1,1,1,2,2,2,2,2,2,3,3,3,3)
		
		if (chip == 1)
		{
			instance_create_layer(x, y, "Instances", chipBluePickup_obj);
		}
		if (chip == 2)
		{
			instance_create_layer(x, y, "Instances", chipRedPickup_obj);
		}
		if (chip == 3)
		{
			instance_create_layer(x, y, "Instances", chipVioletPickup_obj);
		}
	}
	
	//Set Points
	if (global.multiplier < 8) {
		global.multiplier = global.multiplier * 2;
	}
	global.multiplierTimer = global.multiplierTimerSave;
	global.scorepoints += points * global.multiplier;
	
	damageTint = false;
	damageTintHeadshot = false;
	if (headshot)
	{
		instance_change(zombieGirlDeath1_obj, true);
	}
	else
	{
		instance_change(zombieGirlDeath2_obj, true);
	}
}

//###Attack###

//Cooldown
if (!attackInProg && !attackInProg2 && !attackInProg3 && aggro)
{
	if (distance_to_object(player_obj) < aggroRange && distance_to_object(player_obj) > 86)
	{
		if (!frozen) {
			attackCooldown -= global.dt;
		} else {
			attackCooldown -= global.dt / 2;
		}
	}
	if (distance_to_object(player_obj) < 86 && distance_to_object(player_obj) > 32)
	{
		attackInProg2 = true;
	}
	if (distance_to_object(player_obj) < 32)
	{
		attackInProg3 = true;
	}
}

if (attackCooldown < 0 && !attackInProg && !attackInProg2 && !attackInProg3 && aggro)
{
	if (distance_to_object(player_obj) < aggroRange && distance_to_object(player_obj) > 86 && !secondPhase)
	{
		attackInProg = true;
	}
	if (distance_to_object(player_obj) < 86 && distance_to_object(player_obj) > 32)
	{
		attackInProg2 = true;
	}
	if (distance_to_object(player_obj) < 32)
	{
		attackInProg3 = true;
	}
}

//Start Attack 1
if (attackInProg)
{
	repeat (8)
	{
		instance_create_layer(player_obj.x + random_range(-76, 76), player_obj.y + 26, "Instances", targetCircle_obj);
	}
	instance_create_layer(x - 16 + slamPos, y - 168, "ForegroundObjects", shotLightShotgun_obj);
	instance_create_layer(x - 16, y - 168 + slamPos, "ForegroundObjects", smokecloud_obj);
	screenshake(50, 12, 0.6, id);
	attackCooldown = attackCooldownSave;
	attackInProg = false;
	delay = true;
}

//Start Attack 2
if (attackInProg2)
{
	initialShootDelay -= global.dt;
	if (initialShootDelay < 0)
	{
		if (distance_to_object(player_obj) > 32)
		{
			shootDelay -= global.dt;
			if (shootDelay < 0)
			{
				bullet1 = instance_create_layer(x - 52 + random_range(-1, 1), y - 79 + slamPos, "Instances", bulletSensoryTrembler_obj);
				bullet2 = instance_create_layer(x + 52 + random_range(-1, 1), y - 79 + slamPos, "Instances", bulletSensoryTrembler_obj);
				bullet1.dir = 200;
				bullet1.dirChange = true;
				bullet2.dir = 330;
				bullet2.dirChange = true;
				shootDelay = 5;
			}
		}
		attackCooldown = attackCooldownSave;
		delay = true;
	}
}

//Start Attack 3
if (attackInProg3)
{
	if (!pause && !slam)
	{
		smokeDelay -= global.dt;
		slamDelay -= global.dt;
	}
	if (smokeDelay < 0 && !secondPhase)
	{
		instance_create_layer(x - 50 + random_range(-1, 1), y - 136 + slamPos, "ForegroundObjects", dustParticle_obj);
		instance_create_layer(x + 57 + random_range(-1, 1), y - 136 + slamPos, "ForegroundObjects", dustParticle_obj);
		smokeDelay = 4;
	}
	
	if (slamDelay < 0)
	{
		slam = true;
		slamDelay = slamDelaySave;
	}
}

if (slam)
{
	slamSprite = true;
	if (slamPos < 46)
	{
		slamPos += global.dt * 4;
	}
	else
	{
		if (!pause)
		{
			slamHitbox = instance_create_layer(x, y - 16, "Instances", damageHitboxKnockback_obj);
			slamHitbox.image_yscale = 2;
			slamHitbox.image_xscale = 4;
			slamHitbox.damage = damage;
			slamHitbox.timer = 120;
			slamHitbox.knockback = 5;
			
		}
		pause = true;
		slam = false;
	}
}

if (pause)
{
	pauseDelay -= global.dt;
	if (pauseDelay < 0)
	{
		smokeDelay2 -= global.dt;
		if (smokeDelay2 < 0)
		{
			instance_create_layer(x - 24, y - 46 + slamPos, "ForegroundObjects", dustParticle_obj);
			instance_create_layer(x + 24, y - 46 + slamPos, "ForegroundObjects", dustParticle_obj);
			smokeDelay2 = 3;
		}
		if (slamPos > 0)
		{
			slamPos -= global.dt;
		}
		else
		{
			slamPos = 0;
			pauseDelay = pauseDelaySave;
			pause = false;
			attackCooldown = attackCooldownSave;
			delay = true;
		}
	}
}
	
if (delay)
{
	attackDelay -= global.dt;
}
if (attackDelay < 0)
{
	slamSprite = false;
	delay = false;
	attackDelay = attackDelaySave;
	attackInProg = false;
	attackInProg2 = false;
	attackInProg3 = false;
	slam = false;
	slamPos = 0;
	initialShootDelay = initialShootDelaySave;
}

if (damageTintTimer < 0)
{
	//sprite_index = zombieGirl_spr;
	damageTintTimer = damageTintTimerSave;
	damageTint = false;
	damageTintHeadshot = false;
}

checkPlayerTimer -= global.dt;
if (checkPlayerTimer < 0)
{
	if (instance_exists(camera_obj))
	{
		if (x < (camera_obj.x + (camera_obj.xScreenSize / 2) + 128) && x > (camera_obj.x - (camera_obj.xScreenSize / 2) - 128))
		{
			if (y < (camera_obj.y + (camera_obj.yScreenSize / 2) + 128) && y > (camera_obj.y - (camera_obj.yScreenSize / 2) - 128))
			{
				gravityStrength = gravityStrengthSave;
			}
			else
			{
				gravityStrength = 0;
			}
		}
		else
		{
			gravityStrength = 0;
		}
	}
	else
	{
		gravityStrength = 0;
	}
	checkPlayerTimer = checkPlayerTimerSave;
}

//Walk Sound
audio_emitter_position(emitter, x, y, 0);

walkspeedSound -= global.dt;
if (walkspeedSound < 0 && horspeed != 0)
{
	var ticksnd = audio_play_sound_on(emitter, tick_snd, false, 1);
	audio_sound_pitch(ticksnd, random_range(1.3, 1.5));
	walkspeedSound = random_range(24, 32);
}

//Alarmlight follow
if (instance_exists(alarmLight))
{
	with (alarmLight)
	{
		light[| eLight.X] = body.x;
		light[| eLight.Y] = body.y;
		light[| eLight.ShadowLength] = 100;
	}
}