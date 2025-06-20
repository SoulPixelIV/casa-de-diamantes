/// @description Enemy AI

if (!gotSpawned)
{
	spawn = instance_create_layer(x, y, "Instances", enemyHiddenSpawnpoint_obj);
	spawn.hp = hp;
	spawn.aggroRange = aggroRange;
	spawn.spawnID = budOfSong_obj;
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

if (externalAggroTrigger) {
	if (instance_exists(budofsongTrigger_obj)) {
		var nearestTrigger = instance_nearest(x, y, budofsongTrigger_obj);
		if (nearestTrigger.trigger == true) {
			aggro = true;
		}
	}
}

/*
//Walking Animation
if (horspeed != 0 && !attackInProg && !attackInProg2) {
	animationSpeed = 0.5;
	sprite_index = zombieGirlWalking_spr;
}
*/

//Apply Buff
/*
if (buffed) {
	if (!buffApplied) {
		if (hp < hpSave * 2.5) {
			hp *= 2.5
		}
		if (freezeRes < freezeResSave * 2.5) {
			freezeRes *= 2.5;
		}
		buffApplied = true;
	}
	buffTimer -= global.dt;
}

if (buffTimer < 0) {
	buffApplied = false;
	buffed = false;
	
	buffTimer = buffTimerSave;
}*/

//Sight Check
if (instance_exists(player_obj)) {
	if (!collision_line(x, y, player_obj.x, player_obj.y, collider_obj, false, true) && !collision_line(x, y, player_obj.x, player_obj.y, enemyVisionBlockZone_obj, false, true))
	{
		if (collision_line(x, y, player_obj.x, player_obj.y, player_obj, false, true))
		{
			if (distance_to_point(player_obj.x, player_obj.y) < aggroRange)
			{
				if ((image_xscale == 1 && player_obj.x >= x) || (image_xscale == -1 && player_obj.x <= x))
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

if (movement)
{
	if (aggro && distance_to_object(player_obj) > 24 && distance_to_object(player_obj) < maxRunAwayDistance)
	{
		//Check if ground to walk on exists
		if (place_meeting(x + 16 * image_xscale, y + 32, colliderGlobal_obj)) {
			if (instance_exists(hazard_obj))
			{
				//Check if hazard is near and avoid it
				if (!collision_circle(x, y, 64, hazard_obj, false, true))
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
					horspeed = -movSpeed;
				}
				else
				{
					horspeed = movSpeed;
				}
			}
		} else {
			horspeed = 0;
		}
		
		if (dirLookat > 90 && dirLookat < 270)
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
	
	//Stage Jumping
	/*
	if (instance_exists(player_obj) && !jumpToNewDest && aggro) {
		checkForPlayerPosTimer -= global.dt;
		
		if (checkForPlayerPosTimer < 0) {
			currPlayerPosY = player_obj.y;
			
			var platformToCheck = noone;
			var platformStanding = instance_place(x, y + 42, colliderGlobal_obj);
			with (player_obj) {
				platformToCheck = instance_place(x, y + 42, colliderGlobal_obj);
			}
			//Check if player is not on same stage
			if (platformToCheck != platformStanding) {
				if (player_obj.grounded) {
					if (instance_exists(platformToCheck)) {
						xPosGoalRight = player_obj.x;
						xPosGoalLeft = player_obj.x;
						for (i = 0; i < 512; i++) {	
							//Look for edge of platform
							if (!place_meeting(xPosGoalRight + 1, player_obj.y, colliderGlobal_obj) && place_meeting(xPosGoalRight + 1, player_obj.y + 42, colliderGlobal_obj)) {
								xPosGoalRight += 1;
								continue;
							}
							//Look for edge of platform
							if (!place_meeting(xPosGoalLeft - 1, player_obj.y, colliderGlobal_obj) && place_meeting(xPosGoalLeft - 1, player_obj.y + 42, colliderGlobal_obj)) {
								xPosGoalLeft -= 1;
								continue;
							}
							
							if (xPosGoalLeft < xPosGoalRight) {
								randDestX = random_range(xPosGoalLeft, xPosGoalRight);
							} else {
								randDestX = random_range(xPosGoalRight, xPosGoalLeft);
							}
							testX = xPosGoalRight;
							testY = xPosGoalLeft;
							
							//Check if jump is not too far
							if (distance_to_point(randDestX, player_obj.y) < 360) {
								jumpToNewDest = true;
								newDestPosX = randDestX;
								newDestPosY = player_obj.y - 12;
							}
							break;
						}
					}
				} 
			}
		}
	}
	
	if (jumpToNewDest) {		
		stageTeleportTimer -= global.dt;
		
		if (!spawnedStageJumpAnimation) {
			instance_create_layer(x, y, "Instances", stagejumpAnimation_obj);
			instance_create_layer(newDestPosX, newDestPosY, "Instances", stagejumpAnimation_obj);
			spawnedStageJumpAnimation = true;
		}
		
		if (stageTeleportTimer < 0) {
			x = newDestPosX;
			y = newDestPosY;
		
			//Reset Timer
			checkForPlayerPosTimer = checkForPlayerPosTimerSave;
			
			stageTeleportTimer = stageTeleportTimerSave + random_range(-30, 30);
			spawnedStageJumpAnimation = false;
			jumpToNewDest = false;
		}
	}
	*/
}
else
{
	horspeed = 0;
}

//Gravity
if (!noGravity) {
	if (verspeed < 2)
	{
		verspeed -= gravityStrength * global.dt;
	}
	if (attackInProg)
	{
		verspeed = 0;
	}
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

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
	var randNum = choose(1,2,3,4,5,6,7,8,9);
	if (randNum == 9 || player_obj.forceSlowmo)
	{
		with (player_obj) {
			if (!place_meeting(x, y, slowmoCollider_obj)) {
				enemySlowmo = true;
				camFollowTarget = deathCross;
			}
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
	if (lastBullet == bulletDualBarettas_obj)
	{
		if (global.unlockedWeapon[2])
		{
			repeat (ceil(ammoSpawnCount / 4))
			{
				instance_create_layer(x, y - 22, "Instances", ammoShotgunSmall_obj);
			}
		}
	}
	if (lastBullet == bulletShotgun_obj)
	{
		if (global.unlockedWeapon[1])
		{
			repeat (ammoSpawnCount)
			{
				instance_create_layer(x, y - 22, "Instances", ammoPistolSmall_obj);
			}
		}
	}
	if (lastBullet == bulletSilencedMP_obj)
	{
		if (global.unlockedWeapon[4])
		{
			repeat (ceil(ammoSpawnCount / 4))
			{
				instance_create_layer(x, y - 22, "Instances", ammoSniperSmall_obj);
			}
		}
	}
	if (lastBullet == bulletSniper_obj)
	{
		if (global.unlockedWeapon[3])
		{
			repeat (ceil(ammoSpawnCount / 2))
			{
				instance_create_layer(x, y - 22, "Instances", ammoSilencedMPSmall_obj);
			}
		}
	}

	//Drop Money
	var maxAmount = random_range(moneyDropMin, moneyDropMax);
	for (i = 0; i < maxAmount; i++)
	{
		chip = choose(1,1,2,2,3,3,3);
		
		if (chip == 1)
		{
			instance_create_layer(x, y - 22, "Instances", chipBluePickup_obj);
		}
		if (chip == 2)
		{
			instance_create_layer(x, y - 22, "Instances", chipRedPickup_obj);
		}
		if (chip == 3)
		{
			instance_create_layer(x, y - 22, "Instances", chipVioletPickup_obj);
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
	
	instance_destroy();
}

//###Attack###

//Cooldown
if (!attackInProg && !attackInProg2 && aggro && !jumpToNewDest && (verspeed < 0.1 && verspeed > -0.1))
{
	if (!frozen) {
		attackCooldown -= global.dt;
	} else {
		attackCooldown -= global.dt / 2;
	}
}

//Prepare Attack
if (attackCooldown < 0)
{
	/*
	if (distance_to_object(player_obj) < hideDistance) {
		nearestEnemy = id;
		attackInProg = true;
		sprite_index = budOfSongSinging_spr;
		if (!playedSound) {
			audio_play_sound_on(emitter, singing_snd, false, false, 1, 0, choose(1.1, 1.3));		
			playedSound = true;
		}
		movement = false;
	} else {
		if (instance_exists(enemy_obj)) {
			xx = x;
			x -= 10000;
			nearestEnemy = instance_nearest(xx, y, enemy_obj);
			x += 10000
			if (instance_exists(nearestEnemy)) {
				if (distance_to_object(nearestEnemy) < buffRange) {
					sprite_index = budOfSongSinging_spr;
					movement = false;
					attackInProg = true;
					if (!playedSound) {
						audio_play_sound_on(emitter, singing_snd, false, false, 1, 0, choose(1.1, 1.3));		
						playedSound = true;
					}
				} else {
					nearestEnemy = id;
					sprite_index = budOfSongSinging_spr;
					movement = false;
					attackInProg = true;
					if (!playedSound) {
						audio_play_sound_on(emitter, singing_snd, false, false, 1, 0, choose(1.1, 1.3));		
						playedSound = true;
					}
				}
			}
		}
	}
	*/
	//Find all enemies in radius
	for (var i = 0; i < instance_number(enemy_obj); ++i) {
	    enemyList[i] = instance_find(enemy_obj,i);
		if (distance_to_object(enemyList[i]) < buffRange) {
			attackInProg = true;
			sprite_index = budOfSongSinging_spr;
			if (!playedSound) {
				audio_play_sound_on(emitter, singing_snd, false, false, 1, 0, choose(1.1, 1.3));		
				playedSound = true;
			}
			movement = false;
		}
	}

	attackCooldown = attackCooldownSave;
}

if (attackInProg || attackInProg2) {
	//Stop every animation at last frame during attack
	//if (image_index > image_number - 1) {
		//image_index = image_number - 1;
	//}
	
	animationSpeed = 0.75;
	if (attackInProg) {
		attack1PrepareTimer -= global.dt;
	}
	if (attackInProg2) {
		attack2PrepareTimer -= global.dt;
	}
}

if (attackInProg)
{	
	if (attack1PrepareTimer < 0) {
		/*
		if (instance_exists(nearestEnemy)) {
			if (!nearestEnemy.buffApplied) {
				if (!buffEnabled) {
					buffEnabled = true;
					nearestEnemy.buffed = true;
				}
			} else {
				if (!buffEnabled) {
					buffEnabled = true;
					buffed = true;
				}
			}
		}*/
		for (var i = 0; i < array_length(enemyList); i++) {
			if (instance_exists(enemyList[i])) {
				if (!enemyList[i].buffApplied) {
					enemyList[i].buffed = true;
				}
			}
		}
		
		attack1StopTimer -= global.dt;
	}
}

//END Attack 1
if (attackInProg && attack1StopTimer < 0) {
	attackDelay = attackDelaySave;
	attack1PrepareTimer = attack1PrepareTimerSave;
	attack1StopTimer = attack1StopTimerSave + random_range(-20, 20);
	snapHitboxDelay = snapHitboxDelaySave;
	snapAttack = false;
	attackInProg = false;
	animationSpeed = 0.75;
	sprite_index = budOfSong_spr;
	damageCollision = false;
	movement = true;
	spawnedHitbox = false;
	buffEnabled = false;
	playedSound = false;
}

//START ATTACK 2
if (attackInProg2)
{	
	//Attack Flashing
	if (attack2PrepareTimer < 150 && attack2PrepareTimer > 0) {
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
	
	if (attack2PrepareTimer < 0) {			
		attackTint = false;
		attackTintTimer = attackTintTimerSave;
		attackTintDelay = -1;
	
		attack2StopTimer -= global.dt;
		snapHitbox2Delay -= global.dt;
		
		//Only Spawn hitbox once
		if (!snapAttack2) {
			sprite_index = florablasterAttack2Start_spr;
	
			if (snapHitbox2Delay < 0) {
				
				damageRes = 3;

				snapAttack2 = true;
			}
		}
	}
}

if (attackInProg2 && snapAttack2 && attack2StopTimer < 0) {
	sprite_index = florablasterAttack2Stop_spr;
}

//END Attack 2
if (attackInProg2 && sprite_index == florablasterAttack2Stop_spr && image_index = image_number -1) {
	attackDelay = attackDelaySave;
	attack2PrepareTimer = attack2PrepareTimerSave;
	attack2StopTimer = attack2StopTimerSave + random_range(-20, 20);
	snapHitbox2Delay = snapHitbox2DelaySave;
	snapAttack2 = false;
	attackInProg2 = false;
	animationSpeed = 0.75;
	sprite_index = florablaster_spr;
	damageCollision = false;
	movement = true;
	spawnedHitbox = false;
	damageRes = 1;
	
	attackTint = false;
	attackTintTimer = attackTintTimerSave;
	attackTintDelay = -1;
}
	
if (delay)
{
	attackDelay -= global.dt;
}
if (attackDelay < 0)
{
	delay = false;
	attackDelay = attackDelaySave;
	dashed = false;
	attackInProg = false;
	attackInProg2 = false;
	startDrill = false;
	animationSpeed = 0.75;
	if (!lostArm)
	{
		sprite_index = zombieGirl_spr;
	}
	else
	{
		if (!attackInProg) {
			sprite_index = budOfSong_spr;
			//sprite_index = zombieGirlNoArm_spr;
		}
	}
	damageCollision = false;
	movement = true;
	spawnedHitbox = false;
}

if (damageTintTimer < 0)
{
	/*
	if (!lostArm)
	{
		sprite_index = zombieGirl_spr;
	}
	else
	{
		if (!attackInProg) {
			sprite_index = zombieGirl_spr;
			//sprite_index = zombieGirlNoArm_spr;
		}
	} */
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

//Sound Position
audio_emitter_position(emitter, x, y, 0);

//Collision
if (!noCollision) {
	//horspeed
	if (!place_free(x + horspeed * global.dt, y) || place_meeting(x + horspeed * global.dt, y, colliderEnemyOnly_obj))
	{
		if (sign(horspeed) != 0)
		{
			while (place_free(x + sign(horspeed), y) && !place_meeting(x + sign(horspeed), y, colliderEnemyOnly_obj))
			{
				x += sign(horspeed);
			}
			horspeed = 0;
		}
	} 
	//verspeed
	if (!place_free(x, y + verspeed * global.dt) || place_meeting(x, y + verspeed * global.dt, colliderEnemyOnly_obj))
	{
		if (sign(verspeed) != 0)
		{
			while (place_free(x, y + sign(verspeed)) && !place_meeting(x, y + sign(verspeed), colliderEnemyOnly_obj))
			{
				y += sign(verspeed);
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
}

x += horspeed * global.dt;
y += verspeed * global.dt;