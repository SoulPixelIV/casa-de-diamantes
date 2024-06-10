/// @description Enemy AI

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
	sprite_index = spidercorpseWalking_spr;
}

//Sight Check
if (instance_exists(player_obj)) {
	if (!collision_line(x, y, player_obj.x, player_obj.y, collider_obj, false, true) && !collision_line(x, y, player_obj.x, player_obj.y, enemyVisionBlockZone_obj, false, true))
	{
		if (collision_line(x, y, player_obj.x, player_obj.y, player_obj, false, true))
		{
			if (distance_to_point(player_obj.x, player_obj.y) < aggroRange)
			{
				if (stationary) {
					deaggroTimer = deaggroTimerSave;
					aggroTimer -= global.dt;
				} else {
					if ((image_xscale == 1 && player_obj.x >= x) || (image_xscale == -1 && player_obj.x <= x))
					{
						deaggroTimer = deaggroTimerSave;
						aggroTimer -= global.dt;
					}
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

//Callout Spiders
if (aggro) {
	if (callSpiders && !sendCallout) {
		calloutDelay -= global.dt;
		if (calloutDelay < 0) {			
			//SPAWN SPIDERS
			spiderSpawnsNum = instance_number(spidercorpseSpawn_obj);
			
			for (i = 0; i < spiderSpawnsNum; i++) {				
				var currSpawn = instance_find(spidercorpseSpawn_obj, i);
				if (distance_to_object(currSpawn) < callSpidersRange) {
					currSpawn.open = true;
				}
			}
			
			sendCallout = true;
			movement = true;
		}
	}
	
	if (callSpiders && calloutDelay < 50 && !calloutDone) {
		screamDeathTimer -= global.dt;
		
		//Create Scream
		instance_create_layer(x, y, "ForegroundObjects", scream_obj);
		if (screamDeathTimer > 0) {
			screamDelay -= global.dt;
			if (screamDelay < 0) {
				calloutDone = true;
				screamDelay = screamDelaySave;
			}
		}
		
		movement = false;
		horspeed = 0;
	}
}

if (movement)
{
	if (aggro && (player_obj.x > x + 16 + randXDistanceToPlayer || player_obj.x < x - 16 + randXDistanceToPlayer))
	{
		if (!attackInProg) {
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
					horspeed = movSpeed + random_range(-(movSpeed / 3), movSpeed / 3);
				}
				else
				{
					horspeed = -movSpeed + random_range(-(movSpeed / 3), movSpeed / 3);
				}
			}
		}
		
		if (dirLookat > 90 && dirLookat < 270)
		{
			if (!onCeiling) {
				image_xscale = -1;
			} else {
				image_xscale = 1;
			}
		}
		else
		{
			if (!onCeiling) {
				image_xscale = 1;
			} else {
				image_xscale = -1;
			}
		}
	}
	else
	{
		horspeed = 0;
	}
	
	//Wallrunning
	if (!onCeiling) {
		ceilingJumpTimer -= global.dt;
	
		if (ceilingJumpTimer < 0) {
			var startJump = choose(0,1);
			
			if (startJump == 0) {
				if (!instance_exists(ceilingCheck)) {
					ceilingCheck = instance_create_layer(x, y - 16, "Instances", ceilingCheck_obj);
				}
			}
			ceilingJumpTimer = ceilingJumpTimerSave;
		}
	
		if (instance_exists(ceilingCheck)) {
			if (ceilingCheck.foundCeiling) {
				if (!usedTeleportAnim) {
					instance_create_layer(x, y, "Instances", stagejumpAnimation_obj);
					instance_create_layer(ceilingCheck.x, ceilingCheck.y, "Instances", stagejumpAnimation_obj);
					usedTeleportAnim = true;
				}
				stageJumpDelay -= global.dt;
				
				if (stageJumpDelay < 0) {
					image_angle += 180;
					noGravity = true;
					y = ceilingCheck.y;
					instance_destroy(ceilingCheck);
					onCeiling = true;
					movement = true;
					stageJumpDelay = 120;
					usedTeleportAnim = false;
				}
			}
		}
	} else {
		randFallTimer -= global.dt;

		if (randFallTimer < 0 || !place_meeting(x + 16 * image_xscale, y - 24, colliderGlobal_obj)) {
			ceilingJumpTimer = ceilingJumpTimerSave;
			image_angle = 0;
			noGravity = false;
			onCeiling = false;
			randFallTimer = random_range(500, 1400);
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

if (stationary) {
	noGravity = true;
	movement = false;
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

//###Death###
if (hp < 0)
{
	sendCallout = true;
	
	var deathCross = instance_create_layer(x, y, "ForegroundObjects", deathCross_obj);
	
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
		chip = choose(1,1,1,1,2)
		
		if (chip == 1)
		{
			if (image_yscale == 1) {
				instance_create_layer(x, y - 4, "Instances", chipBluePickup_obj);
			} else {
				instance_create_layer(x, y + 4, "Instances", chipBluePickup_obj);
			}
		}
		if (chip == 2)
		{
			if (image_yscale == 1) {
				instance_create_layer(x, y - 4, "Instances", chipRedPickup_obj);
			} else {
				instance_create_layer(x, y + 4, "Instances", chipRedPickup_obj);
			}
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
	
	if (instance_exists(ceilingCheck)) {
		instance_destroy(ceilingCheck);
	}
	
	var amount = random_range(5, 8);
	repeat(amount) {
		instance_create_layer(x, y, "Instances", zombieChunk_obj);
	}
	instance_destroy();
}

//###Attack###

//Cooldown
if (!attackInProg && !attackInProg2 && aggro && !jumpToNewDest && (verspeed < 0.1 && verspeed > -0.1))
{
	if ((callSpiders && sendCallout) || !callSpiders) {
		if (distance_to_object(player_obj) < 128) {
			if (!frozen) {
				//attackCooldown -= global.dt;
			} else {
				//attackCooldown -= global.dt / 2;
			}
		}
	}
}

//Prepare Attack
if (attackCooldown < 0)
{
	if (!onCeiling) {
		if (distance_to_object(player_obj) < 128) {
			sprite_index = spidercorpseAttack1_spr;
			movement = false;
			attackInProg = true;
		}
	} else {
		sprite_index = spidercorpseAttack2_spr;
			movement = false;
			attackInProg2 = true;
	}

	attackCooldown = attackCooldownSave;
}

if (attackInProg) {
	//Stop every animation at last frame during attack
	if (image_index > image_number - 1) {
		image_index = image_number - 1;
	}
	
	animationSpeed = 0.75;
	if (attackInProg) {
		attack1PrepareTimer -= global.dt;
	}
}

if (attackInProg)
{	
	if (!stoppedMomentum) {
		horspeed = 0;
		stoppedMomentum = true;
	}
	
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
			if (snapHitboxDelay < 0) {
				//Front Dash
				if (player_obj.y > y - 32 && player_obj.y < y + 32)
				{
					frontDash_scr(id);
				}
				else
				{
					frontDash_scr(id);
				}
	
				hitboxDash = instance_create_layer(x + (48 * image_xscale), y, "Instances", damageHitbox_obj);
				hitboxDash.image_yscale = 1.5;
				hitboxDash.image_xscale = 3.5;
				hitboxDash.damage = damage;
				hitboxDash.timer = 100;

				snapAttack = true;
			}
		}
	}
}

if (instance_exists(hitboxDash))
{
	if (attackInProg) {
		hitboxDash.follow = true;
		hitboxDash.followX = x + (48 * image_xscale);
		hitboxDash.followY = y;
	}
	if (attackInProg2) {
		hitboxDash.follow = true;
		hitboxDash.followX = x;
		hitboxDash.followY = y + 12;
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
	sprite_index = spidercorpse_spr;
	damageCollision = false;
	movement = true;
	spawnedHitbox = false;
	stoppedMomentum = false;
}


if (attackInProg2) {
	//Stop every animation at last frame during attack
	if (image_index > image_number - 1) {
		image_index = image_number - 1;
	}
	
	animationSpeed = 0.75;
	if (attackInProg2) {
		attack2PrepareTimer -= global.dt;
	}
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
			onCeiling = false;
			noGravity = false;
			if (snapHitbox2Delay < 0) {
				hitboxDash = instance_create_layer(x, y + 12, "Instances", damageHitbox_obj);
				hitboxDash.image_yscale = 1.5;
				hitboxDash.image_xscale = 3;
				hitboxDash.damage = damage;
				hitboxDash.timer = 100;

				snapAttack2 = true;
			}
		}
	}
}

//END Attack 2
if (attackInProg2 && attack2StopTimer < 0) {
	attackDelay = attackDelaySave;
	attack2PrepareTimer = attack2PrepareTimerSave;
	attack2StopTimer = attack2StopTimerSave + random_range(-20, 20);
	snapHitbox2Delay = snapHitbox2DelaySave;
	snapAttack2 = false;
	attackInProg2 = false;
	animationSpeed = 0.75;
	sprite_index = spidercorpse_spr;
	damageCollision = false;
	movement = true;
	spawnedHitbox = false;
	image_angle = 0;
	
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
	sprite_index = spidercorpse_spr;
	damageCollision = false;
	movement = true;
	spawnedHitbox = false;
}

if (damageTintTimer < 0)
{
	/*
	if (!lostArm)
	{
		sprite_index = spidercorpse_spr;
	}
	else
	{
		if (!attackInProg) {
			sprite_index = spidercorpse_spr;
			//sprite_index = zombieGirlNoArm_spr;
		}
	}*/
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
			//horspeed = -movSpeed;
		}
		else
		{
			//horspeed = movSpeed;
		}
	}
}

if (!onCeiling) {
	x += horspeed * global.dt;
	y += verspeed * global.dt;
} else {
	x += (horspeed / 1.5) * global.dt;
	y += verspeed * global.dt;
}