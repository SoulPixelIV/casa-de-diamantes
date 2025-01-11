/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;
if (instance_exists(player_obj)) {
	dirLookat = point_direction(x, y, player_obj.x, player_obj.y);
}

if (!gotSpawned)
{
	spawn = instance_create_layer(x, y, "Instances", enemyHiddenSpawnpoint_obj);
	spawn.hp = hp;
	spawn.aggroRange = aggroRange;
	spawn.spawnID = zombieGirlWounded_obj;
	spawn.dir = image_xscale;
	gotSpawned = true;
}

//Sight Check
if (instance_exists(player_obj)) {
	if (!collision_line(x, y, player_obj.x, player_obj.y, collider_obj, false, true) && !collision_line(x, y, player_obj.x, player_obj.y, enemyVisionBlockZone_obj, false, true))
	{
		if (collision_line(x, y, player_obj.x, player_obj.y, player_obj, false, true))
		{
			if (distance_to_point(player_obj.x, player_obj.y) < aggroRange)
			{
				if ((image_xscale > 0 && player_obj.x >= x) || (image_xscale < 0 && player_obj.x <= x))
				{
					deaggroTimer = deaggroTimerSave;
					aggroTimer -= global.dt;
				}
			}
		}
		
		//Check if player is right behind enemy
		if (distance_to_point(player_obj.x, player_obj.y) < 32) {
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

if (movement && distance_to_object(player_obj) < 500)
{
	if (aggro)
	{
		if (distance_to_object(player_obj) > 24)
		{
			if (instance_exists(hazard_obj))
			{
				if (!collision_circle(x, y, 64, hazard_obj, false, true))
				{
					if (!turnDelayStart) {
						if (player_obj.x > x)
						{
							horspeed = -movSpeed;
						}
						else
						{
							horspeed = movSpeed;
						}
						turnDelayStart = true;
					}
				}
				else
				{
					hazard = instance_nearest(x, y, hazard_obj);
					if (!turnDelayStart) {
						if (hazard.x > x)
						{
							horspeed = -movSpeed;
						}
						else
						{
							horspeed = movSpeed;
						}
						turnDelayStart = true;
					}
				}
			}
			else
			{
				if (!turnDelayStart) {
					if (player_obj.x > x)
					{
						horspeed = -movSpeed;
					}
					else
					{
						horspeed = movSpeed;
					}
					turnDelayStart = true;
				}
			}
			if (horspeed < 0)
			{
				image_xscale = -1;
			}
			else
			{
				image_xscale = 1;
			}
		}
		else
		{
			horspeed = 0;
		}	
	}
}
else
{
	horspeed = 0;
}

//Drop Money while walking
if (horspeed != 0) {
	moneyDropTimer -= global.dt;
	if (moneyDropTimer < 0) {
		instance_create_layer(x, y - 4, "Instances", chipBluePickup_obj);
		moneyDropTimer = moneyDropTimerSave;
	}
}

//Gravity
if (verspeed < 2)
{
	verspeed -= gravityStrength * global.dt;
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
if (!place_free(x, y + (verspeed * global.dt)))
{
	if (sign(verspeed) != 0)
	{
		while (place_free(x, y + sign(verspeed) / 100))
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

//Turn Delay
if (turnDelayStart) {
	turnDelay -= global.dt;
}

if (turnDelay < 0) {
	turnDelayStart = false;
	turnDelay = turnDelaySave;
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

//Sound Position
audio_emitter_position(emitter, x, y, 0);

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

//Particle System
part_emitter_region(global.partSystem, partEmitter, x - 12, x + 12, y - 18, y + 26, ps_shape_ellipse, ps_distr_invgaussian);

//Burnt
if (burnt) {
	image_blend = make_color_rgb(255, 144, 0);
	burnTimer -= global.dt;
	if (burnTimer < 0) {
		part_emitter_burst(global.partSystem, partEmitter, global.flameSparkPart, 19);
		damageTint = true;
		hp -= 2 / damageRes;
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

//###Death###
if (hp < 0)
{
	var deathCross = instance_create_layer(x, y - 8, "ForegroundObjects", deathCross_obj);
	
	//Enemy Slowmo
	if (!disableSlowmo) {
		var randNum = choose(1,2,3,4,5,6,7,8,9);
		if (randNum == 9 || player_obj.forceSlowmo)
		{
			player_obj.enemySlowmo = true;
			player_obj.camFollowTarget = deathCross;
		}
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
	repeat (ammoSpawnCount)
	{
		instance_create_layer(x, y, "Instances", healthSmall_obj);
		if (global.unlockedWeapon[1])
		{
			instance_create_layer(x, y, "Instances", ammoPistolSmall_obj);
		}
	}
	repeat (ammoSpawnCount / 4)
	{
		if (global.unlockedWeapon[2])
		{
			instance_create_layer(x, y, "Instances", ammoShotgunSmall_obj);
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
	repeat(25)
	{
		instance_create_layer(x, y, "Instances", chipBluePickup_obj);
	}
	repeat(15)
	{
		instance_create_layer(x, y, "Instances", chipRedPickup_obj);
	}
	repeat(5)
	{
		instance_create_layer(x, y, "Instances", chipVioletPickup_obj);
	}
	
	//Set Points
	if (global.multiplier < 8) {
		global.multiplier = global.multiplier * 2;
	}
	global.multiplierTimer = global.multiplierTimerSave;
	global.scorepoints += points * global.multiplier;
	
	damageTint = false;
	damageTintHeadshot = false;
	instance_destroy(alarmLight);
	//instance_change(zombieGirlWoundedDeath1_obj, false);
	instance_destroy();
}

if (damageTintTimer < 0)
{
	//sprite_index = zombieGirlWounded_spr;
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

//Alarm Light
with (alarmLight)
{
	if (instance_exists(body)) {
		light[| eLight.X] = body.x;
		light[| eLight.Y] = body.y;
	}
}