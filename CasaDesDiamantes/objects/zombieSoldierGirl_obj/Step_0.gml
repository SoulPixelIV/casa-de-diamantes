/// @description Enemy AI

if (!gotSpawned)
{
	spawn = instance_create_layer(x, y, "Instances", enemyHiddenSpawnpoint_obj);
	spawn.hp = hp;
	spawn.aggroRange = aggroRange;
	spawn.spawnID = zombieSoldierGirl_obj;
	gotSpawned = true;
}

if (instance_exists(player_obj))
{
	dirLookat = point_direction(x, y, player_obj.x, player_obj.y);
}

if (attackCooldown > 75 && (attackInProg1 || attackInProg2))
{
	playerPosX = player_obj.x;
	playerPosY = player_obj.y;
}

//Rotate towards player
if (instance_exists(player_obj)) {
	if (aggro) {
		if (distance_to_object(player_obj) < aggroRange) {
			if (attackCooldown > 150 || attackCooldown < 0) {
				if (!place_meeting(x + 24, y, collider_obj) && !place_meeting(x - 24, y, collider_obj) && !place_meeting(x, y + 24, collider_obj) && !place_meeting(x, y - 24, collider_obj)) {
					if (!place_meeting(x + 24, y, neuralColliders_obj) && !place_meeting(x - 24, y, neuralColliders_obj) && !place_meeting(x, y + 24, neuralColliders_obj) && !place_meeting(x, y - 24, neuralColliders_obj)) {
						image_angle = point_direction(x, y, player_obj.x, player_obj.y);
					}
				}
			}
		}
	}
	
	if (!aggro && initalDir == -1) {
		image_angle = 180;
	}
	
	if (image_xscale == -1) {
		image_xscale = 1;
	}
	
	if (image_angle > 90 && image_angle < 270) {
		image_yscale = -1;
	} else {
		image_yscale = 1;
	}
}

//Sight Check
if (instance_exists(player_obj)) {
	if (!collision_line(x, y, player_obj.x, player_obj.y, colliderOneWay_obj, false, true) && !collision_line(x, y, player_obj.x, player_obj.y, collider_obj, false, true) && !collision_line(x, y, player_obj.x, player_obj.y, enemyVisionBlockZone_obj, false, true) && !collision_line(x, y, player_obj.x, player_obj.y, neuralColliders_obj, false, true))
	{
		if (collision_line(x, y, player_obj.x, player_obj.y, player_obj, false, true))
		{
			if (distance_to_point(player_obj.x, player_obj.y) < aggroRange)
			{
				if ((image_angle > 90 && image_angle < 270) && player_obj.x <= x) {
					deaggroTimer = deaggroTimerSave;
					aggroTimer -= global.dt;
				}
				if (initalDir == 1 && player_obj.x > x) {
					deaggroTimer = deaggroTimerSave;
					aggroTimer -= global.dt;
				}
			}
		}
		
		//Check if player is right behind enemy
		if (distance_to_point(player_obj.x, player_obj.y) < 18) {
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

if (deaggroTimer < 0)
{
	if (!place_meeting(x, y, battleArena_obj) && room != infiniteSpawn) {
		aggro = false;
		deaggroTimer = deaggroTimerSave;
	}
}
if (aggroTimer < 0)
{
	aggro = true;
	aggroTimer = aggroTimerSave;
}

if (movement)
{
	if (aggro) {
		//Check for walls
		if (collision_circle(x, y, 8, colliderOneWay_obj, false, true)) {
			verspeed = -movSpeed;
		}
		//Fly down to player
		if (x < player_obj.x + aggroRange && x > player_obj.x - aggroRange) {
			if (y < player_obj.y - 86) {
				verspeed = movSpeed;
			}
		}
	}
	
	if (aggro)
	{
		//MOVE TOWARDS PLAYER
		if (distance_to_object(player_obj) > DistFromPlayer) {
			if (player_obj.x + playerPosRandOffsetX > x) {
				horspeed = movSpeed;
			} else {
				horspeed = -movSpeed;
			}
			if (player_obj.y + playerPosRandOffsetY > y) {
				verspeed = movSpeed;
			} else {
				verspeed = -movSpeed;
			}
		//MOVE AWAY FROM PLAYER
		} else {
			if (player_obj.x + playerPosRandOffsetX > x) {
				horspeed = -movSpeed / 1.5;
			} else {
				horspeed = movSpeed / 1.5;
			}
			if (player_obj.y + playerPosRandOffsetY > y) {
				verspeed = -movSpeed / 1.5;
			} else {
				verspeed = movSpeed / 1.5;
			}
		}
	}
}

//Slow Floating Movement
if (dir == 0)
{
	if (verspeed > -0.2)
	{
		verspeed -= global.dt / 800;
	}
	if (verspeed <= -0.2)
	{
		dir = 1;
	}
}
else
{
	if (verspeed < 0.2)
	{
		verspeed += global.dt / 800;
	}
	if (verspeed >= 0.2)
	{
		dir = 0;
	}
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

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
	if (!damageTint && !attackTint) {
		image_blend = c_white;
	}
}

if (freezeRes <= 0) {
	frozen = true;
}

//Death
if (hp < 0)
{
	var deathCross = instance_create_layer(x, y - 8, "ForegroundObjects", deathCross_obj);
	
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
	
	//Drop Money
	var maxAmount = random_range(moneyDropMin, moneyDropMax);
	for (i = 0; i < maxAmount; i++)
	{
		chip = choose(1,1,1,1,2,2,2,3);
		
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
	attackCooldown = attackCooldownSave;
	
	var stinger = instance_create_layer(x - 12, y, "Instances", zombieSoldierGirlBodyPart_obj);
	stinger.image_index = 0;
	var head = instance_create_layer(x + 6, y - 2, "Instances", zombieSoldierGirlBodyPart_obj);
	head.image_index = 1;
	var leg = instance_create_layer(x - 12, y + 6, "Instances", zombieSoldierGirlBodyPart_obj);
	leg.image_index = 2;
	
	var amount = random_range(12, 18);
	repeat(amount) {
		instance_create_layer(x, y, "Instances", zombieChunk_obj);
	}
	
	var amount2 = random_range(6, 12);
	repeat(amount2) {
		var blood = instance_create_layer(x + random_range(-16, 16), y + random_range(-20, 20), "Instances", bloodSpread2_obj);
		blood.image_xscale = choose(random_range(0.7, 1), random_range(-0.7, -1));
		blood.image_yscale = choose(random_range(0.7, 1), random_range(-0.7, -1));
	}
	
	instance_destroy();
}

//Attack
if (aggro)
{	
	if (instance_exists(player_obj))
	{
		if (distance_to_object(player_obj) < DistFromPlayer + 64)
		{
			if (!frozen) {
				attackCooldown -= global.dt;
			} else {
				attackCooldown -= global.dt / 2;
			}
		} else {
			attackCooldown = attackCooldownSave;
		}
	}

	if (randAttack == 1)
	{
		attackInProg1 = true;
	}
	else
	{
		attackInProg2 = true;
		//sprite_index = zombieSoldierGirlGrenate_spr;
	}

	//#######ATTACK 1###############
	if (attackCooldown < 200 && attackInProg1)
	{
		sprite_index = zombieSoldierGirlAim_spr;
		
		//Attack Flash
		if (attackCooldown < 75) {
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
	if (attackCooldown < 0 && attackInProg1)
	{
		var shot = audio_play_sound_on(emitter, flyingInsectShot_snd, false, 1);
		audio_sound_pitch(shot, random_range(0.9, 1.1));
		
		instance_create_layer(x + 10, y, "Instances", bulletZombieSoldierGirl_obj);
		instance_create_layer(x + 10, y, "Instances", shotLightDualBarettas_obj);	

		attackCooldown = attackCooldownSave;
		sprite_index = zombieSoldierGirl_spr;
		attackInProg1 = false;
		attackInProg2 = false;
		randAttack = choose(1,2);
		
		attackTint = false;
		attackTintTimer = attackTintTimerSave;
		attackTintDelay = -1;
	}
	
	//#######ATTACK 2###############
	if (attackCooldown < 200 && attackInProg2)
	{
		sprite_index = zombieSoldierGirlAim_spr;
		
		//Attack Flash
		if (attackCooldown < 75) {
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
	if (attackCooldown < 0 && attackInProg2)
	{	
		repeat(6) {
			var grenate = instance_create_layer(x, y, "Instances", grenatePlant_obj);
		}
		attackCooldown = attackCooldownSave;
		//sprite_index = zombieSoldierGirlGrenate_spr;
		attackInProg1 = false;
		attackInProg2 = false;
		randAttack = choose(1,2);
		
		attackTint = false;
		attackTintTimer = attackTintTimerSave;
		attackTintDelay = -1;
	}
}

if (damageTintTimer < 0)
{
	//sprite_index = zombieSoldierGirl_spr;
	damageTintTimer = damageTintTimerSave;
	damageTint = false;
	damageTintHeadshot = false;
}

//Reset Tint
if (distance_to_object(player_obj) > DistFromPlayer + 64)
{
	attackTint = false;
	attackTintTimer = attackTintTimerSave;
	attackTintDelay = -1;
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

//Play attack sound
if (aggro && attackCooldown < 120 && attackInProg1)
{
	if (!audio_is_playing(sniperShotLoad_snd))
	{
		var loadedShot = audio_play_sound_on(emitter, sniperShotLoad_snd, false, false);
		audio_sound_pitch(loadedShot, (attackCooldown / 10));
	}
}

if (global.pause) {
	audio_stop_sound(sniperShotLoad_snd);
}

//Sound Position
if (audio_emitter_exists(emitter)) {
	audio_emitter_position(emitter, x, y, 0);
}

//Collision
//horspeed
if (place_meeting(x + (horspeed * global.dt), y, collider_obj) || place_meeting(x + (horspeed * global.dt), y, neuralColliders_obj))
{
	if (sign(horspeed) != 0)
	{
		while (place_free(x + sign(horspeed), y))
		{
			x += sign(horspeed);
		}
		horspeed = 0;
	}
} 
//verspeed
if (place_meeting(x, y + (verspeed * global.dt), collider_obj) || place_meeting(x + (horspeed * global.dt), y, neuralColliders_obj))
{
	if (sign(verspeed) != 0)
	{
		while (place_free(x, y + sign(verspeed)))
		{
			y += sign(verspeed);
		}
		verspeed = 0;
	}
}

x += horspeed * global.dt;
y += verspeed * global.dt;