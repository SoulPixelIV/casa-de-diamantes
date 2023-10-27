/// @description Enemy AI

lifeTimer -= global.dt;

if (lifeTimer < 0) {
	audio_play_sound(pistolShot_snd, 1, false);
	instance_destroy();
}

if (!gotSpawned)
{
	spawn = instance_create_layer(x, y, "Instances", enemyHiddenSpawnpoint_obj);
	spawn.hp = hp;
	spawn.aggroRange = aggroRange;
	spawn.spawnID = zombieGirl_obj;
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

//Walking Animation
if (horspeed != 0 && !attackInProg && !attackInProg2) {
	animationSpeed = 0.5;
	sprite_index = zombieGirlWalking_spr;
}

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
	if (aggro && distance_to_object(player_obj) > 24 + randDist)
	{
		//Check if ground to walk on exists
		if (place_meeting(x + 16 * image_xscale, y + 24, colliderGlobal_obj)) {
			if (instance_exists(hazard_obj))
			{
				//Check if hazard is near and avoid it
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
								//Check if destination is in teleport block zone
								if (!instance_place(randDestX, player_obj.y - 12, enemyTeleportBlockZone_obj)) {
									jumpToNewDest = true;
									newDestPosX = randDestX;
									newDestPosY = player_obj.y - 12;
								}
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
		chip = choose(1,1,1,1,2)
		
		if (chip == 1)
		{
			instance_create_layer(x, y, "Instances", chipBluePickup_obj);
		}
		if (chip == 2)
		{
			instance_create_layer(x, y, "Instances", chipRedPickup_obj);
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
	var head = instance_create_layer(x, y - 8, "Instances", zombiegirlBodyPart_obj);
	head.image_index = 0;
	var leg = instance_create_layer(x + 2, y + 8, "Instances", zombiegirlBodyPart_obj);
	leg.image_index = 1;
	var arm = instance_create_layer(x - 4, y, "Instances", zombiegirlBodyPart_obj);
	arm.image_index = 2;
	
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

//###Attack###

//Cooldown
if (!attackInProg && !attackInProg2 && aggro && !jumpToNewDest && (verspeed < 0.1 && verspeed > -0.1))
{
	if (distance_to_object(player_obj) < 128) {
		attackCooldown -= global.dt;
	}
}

//Prepare Attack
if (attackCooldown < 0)
{
	if (distance_to_object(player_obj) < 128) {
		if (player_obj.y + 16 < y) {
			sprite_index = zombieGirlAttack2_spr;
			movement = false;
			attackInProg2 = true;
		} else {
			sprite_index = zombieGirlAttack1_spr;
			movement = false;
			attackInProg = true;
		}
	}

	attackCooldown = attackCooldownSave;
}

if (attackInProg || attackInProg2) {
	//Stop every animation at last frame during attack
	if (image_index > image_number - 1) {
		image_index = image_number - 1;
	}
	
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
	//Attack Flashing
	if (attack1PrepareTimer < 150 && attack1PrepareTimer > 0) {
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
	
	if (attack1PrepareTimer < 0) {		
		attackTint = false;
		attackTintTimer = attackTintTimerSave;
		attackTintDelay = -1;
	
		attack1StopTimer -= global.dt;
		snapHitboxDelay -= global.dt;
		
		//Only Spawn hitbox once
		if (!snapAttack) {
			sprite_index = zombieGirlAttack1Start_spr;
	
			if (snapHitboxDelay < 0) {
				hitboxFlowerAttack = instance_create_layer(x + (48 * image_xscale), y, "Instances", damageHitbox_obj);
				hitboxFlowerAttack.image_yscale = 1.5;
				hitboxFlowerAttack.image_xscale = 3.5;
				hitboxFlowerAttack.damage = damage;
				hitboxFlowerAttack.timer = 100;

				snapAttack = true;
			}
		}
	}
}

if (instance_exists(hitboxFlowerAttack))
{
	if (attackInProg) {
		hitboxFlowerAttack.follow = true;
		hitboxFlowerAttack.followX = x + (48 * image_xscale);
		hitboxFlowerAttack.followY = y;
	}
	if (attackInProg2) {
		hitboxFlowerAttack.follow = true;
		hitboxFlowerAttack.followX = x;
		hitboxFlowerAttack.followY = y - 48;
	}
}

if (attackInProg && snapAttack && attack1StopTimer < 0) {
	sprite_index = zombieGirlAttack1Stop_spr;
}

//END Attack 1
if (attackInProg && sprite_index == zombieGirlAttack1Stop_spr && image_index = image_number -1) {
	attackDelay = attackDelaySave;
	attack1PrepareTimer = attack1PrepareTimerSave;
	attack1StopTimer = attack1StopTimerSave + random_range(-20, 20);
	snapHitboxDelay = snapHitboxDelaySave;
	snapAttack = false;
	attackInProg = false;
	animationSpeed = 0.75;
	if (!lostArm)
	{
		sprite_index = zombieGirl_spr;
	}
	else
	{
		sprite_index = zombieGirl_spr;
		//sprite_index = zombieGirlNoArm_spr;
	}
	damageCollision = false;
	movement = true;
	spawnedHitbox = false;
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
			sprite_index = zombieGirlAttack2Start_spr;
	
			if (snapHitbox2Delay < 0) {
				hitboxFlowerAttack = instance_create_layer(x, y - 48, "Instances", damageHitbox_obj);
				hitboxFlowerAttack.image_yscale = 3.5;
				hitboxFlowerAttack.image_xscale = 1.5;
				hitboxFlowerAttack.damage = damage;
				hitboxFlowerAttack.timer = 100;

				snapAttack2 = true;
			}
		}
	}
}

if (attackInProg2 && snapAttack2 && attack2StopTimer < 0) {
	sprite_index = zombieGirlAttack2Stop_spr;
}

//END Attack 2
if (attackInProg2 && sprite_index == zombieGirlAttack2Stop_spr && image_index = image_number -1) {
	attackDelay = attackDelaySave;
	attack2PrepareTimer = attack2PrepareTimerSave;
	attack2StopTimer = attack2StopTimerSave + random_range(-20, 20);
	snapHitbox2Delay = snapHitbox2DelaySave;
	snapAttack2 = false;
	attackInProg2 = false;
	animationSpeed = 0.75;
	if (!lostArm)
	{
		sprite_index = zombieGirl_spr;
	}
	else
	{
		sprite_index = zombieGirl_spr;
		//sprite_index = zombieGirlNoArm_spr;
	}
	damageCollision = false;
	movement = true;
	spawnedHitbox = false;
	
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
			sprite_index = zombieGirl_spr;
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