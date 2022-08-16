/// @description Enemy AI

if (!gotSpawned)
{
	spawn = instance_create_layer(x, y, "Instances", enemyHiddenSpawnpoint_obj);
	spawn.hp = hp;
	spawn.aggroRange = aggroRange;
	spawn.spawnID = zombieBucketGirl_obj;
	spawn.dir = image_xscale;
	gotSpawned = true;
}

dirLookat = point_direction(x, y, player_obj.x, player_obj.y);

//Walking Animation
if (horspeed != 0 && !attackInProg1 && !attackInProg2) {
	animationSpeed = 0.75;
	sprite_index = zombieBucketGirlWalking_spr;
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
	if (dirLookat > 90 && dirLookat < 270)
	{
		image_xscale = -1;
	}
	else
	{
		image_xscale = 1;
	}
		
	if (aggro && distance_to_object(player_obj) > 128)
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
}
else
{
	horspeed = 0;
}

//Gravity
if (verspeed < 2)
{
	verspeed -= gravityStrength * global.dt;
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

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
					instance_create_layer(x, y - 16, "Instances", healthSmall_obj);
				}
			}
			else
			{
				repeat (4)
				{
					instance_create_layer(x, y - 16, "Instances", healthSmall_obj);
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
		chip = choose(1,1,1,2,2,2,2,2,2,3);
		
		if (chip == 1)
		{
			instance_create_layer(x, y - 16, "Instances", chipBluePickup_obj);
		}
		if (chip == 2)
		{
			instance_create_layer(x, y - 16, "Instances", chipRedPickup_obj);
		}
		if (chip == 3)
		{
			instance_create_layer(x, y - 16, "Instances", chipVioletPickup_obj);
		}
	}
	
	//Set Points
	if (global.multiplier < 8) {
		global.multiplier = global.multiplier * 2;
	}
	global.multiplierTimer = global.multiplierTimerSave;
	global.scorepoints += points * global.multiplier;
	
	instance_destroy();
}

//###Attack###

if (aggro && !attackInProg1 && !attackInProg2)
{
	if (distance_to_object(player_obj) < aggroRange) {
		attackCooldown -= global.dt;
	}
}

//Prepare Attack
if (attackCooldown < 0)
{
	if (randAttack == 1)
	{
		sprite_index = zombieBucketGirlAttack1_spr;
		movement = false;
		attackInProg1 = true;
	}
	else
	{
		sprite_index = zombieBucketGirlAttack2_spr;
		movement = false;
		attackInProg2 = true;
	}
	
	attackCooldown = attackCooldownSave;
}

if (attackInProg1 || attackInProg2) {
	//Stop every animation at last frame during attack
	if (image_index > image_number - 1) {
		image_index = image_number - 1;
	}
	
	animationSpeed = 0.75;
	if (attackInProg1) {
		attack1PrepareTimer -= global.dt;
	}
	if (attackInProg2) {
		attack2PrepareTimer -= global.dt;
	}
}

//Start Attack 1
if (attackInProg1)
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
			if (!switchedSprite) {
				image_index = 0;
				sprite_index = zombieBucketGirlAttack1Start_spr;
				switchedSprite = true;
			}
	
			if (snapHitboxDelay < 0) {
				hitboxFlowerAttack = instance_create_layer(x + (42 * image_xscale), y, "Instances", damageHitbox_obj);
				hitboxFlowerAttack.image_yscale = 3;
				hitboxFlowerAttack.image_xscale = 2;
				hitboxFlowerAttack.damage = damage;
				hitboxFlowerAttack.timer = 100;
				
				instance_create_layer(x + 10 * image_xscale, y - 10 * image_xscale, "ForegroundObjects", dustParticle_obj);
				repeat(6)
				{
					var grenate = instance_create_layer(x + 10 * image_xscale, y, "Instances", flyingGrenate_obj);
					grenate.horspeed = random_range(1.4, 2.6) * image_xscale;
					grenate.verspeed = random_range(-0.2, -0.8);
				}

				snapAttack = true;
			}
		}
	}
}

if (instance_exists(hitboxFlowerAttack))
{
	if (attackInProg1) {
		hitboxFlowerAttack.follow = true;
		hitboxFlowerAttack.followX = x + (48 * image_xscale);
		hitboxFlowerAttack.followY = y;
	}
}

if (attackInProg1 && snapAttack && attack1StopTimer < 0) {
	sprite_index = zombieBucketGirlAttack1Stop_spr;
}

//END Attack 1
if (attackInProg1 && sprite_index == zombieBucketGirlAttack1Stop_spr && image_index = image_number -1) {
	attackDelay = attackDelaySave;
	attack1PrepareTimer = attack1PrepareTimerSave;
	attack1StopTimer = attack1StopTimerSave;
	snapHitboxDelay = snapHitboxDelaySave;
	snapAttack = false;
	attackInProg1 = false;
	animationSpeed = 0.75;
	sprite_index = zombieBucketGirl_spr;
	damageCollision = false;
	movement = true;
	spawnedHitbox = false;
	switchedSprite = false;
	randAttack = choose(1,2);
}

//Start Attack 2
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
		
		//Only Spawn Flower Object once
		if (!roseAttack) {
			if (!switchedSprite) {
				image_index = 0;
				sprite_index = zombieBucketGirlAttack2Start_spr;
				switchedSprite = true;
			}
			
			screenshake(50, 12, 0.6, id);
			flowerline = instance_create_layer(x + 15 * image_xscale, y + 38, "Instances", flowerline_obj);
			flowerline.dir = image_xscale;
			roseAttack = true;
		}
	}
}

if (attackInProg2 && roseAttack && attack2StopTimer < 0) {
	sprite_index = zombieBucketGirlAttack1Stop_spr;
}

//END Attack 2
if (attackInProg2 && sprite_index == zombieBucketGirlAttack1Stop_spr && image_index = image_number -1) {
	attackDelay = attackDelaySave;
	attack2PrepareTimer = attack2PrepareTimerSave;
	attack2StopTimer = attack2StopTimerSave;
	roseAttack = false;
	attackInProg2 = false;
	animationSpeed = 0.75;
	sprite_index = zombieBucketGirl_spr;
	damageCollision = false;
	movement = true;
	randAttack = choose(1,2);
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
	if (!attackInProg1) {
		sprite_index = zombieBucketGirl_spr;
	}
	damageCollision = false;
	movement = true;
	spawnedHitbox = false;
}

if (damageTintTimer < 0)
{
	sprite_index = zombieBucketGirl_spr;
	damageTintTimer = damageTintTimerSave;
	damageTint = false;
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

//Collision
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

x += horspeed * global.dt;
y += verspeed * global.dt;