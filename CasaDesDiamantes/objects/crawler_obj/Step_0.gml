/// @description Enemy AI

if (!gotSpawned)
{
	spawn = instance_create_layer(x, y, "Instances", enemyHiddenSpawnpoint_obj);
	spawn.hp = hp;
	spawn.aggroRange = aggroRange;
	spawn.spawnID = crawler_obj;
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

if (aggro && movement)
{
	if (checkedWaypoint && !attackInProg1)
	{
		if (instance_exists(player_obj))
		{
			if (player_obj.x > x)
			{
				dir = 0;
				image_xscale = 1;
			}
			else
			{
				dir = 1;
				image_xscale = -1;
			}
		}
	}
	
	if (dir == 0)
	{
		if (movSpeedGrad <= movSpeed)
		{
			movSpeedGrad += global.dt / 200;
		}
	}
	else
	{
		if (movSpeedGrad >= -movSpeed)
		{
			movSpeedGrad -= global.dt / 200;
		}
	}
	
	if (attackInProg1)
	{
		movSpeedGrad = 0;
	}
	
	if (checkedWaypoint)
	{
		if (instance_exists(player_obj))
		{
			if (player_obj.x > x)
			{
				dir = 0;
			}
			else
			{
				dir = 1;
			}
		}
	}
	else
	{
		if (instance_exists(waypoint))
		{
			//Walk to Waypoint
			if (distance_to_object(waypoint) > 4)
			{
				if (waypoint.x > x)
				{
					dir = 0;
				}
				else
				{
					dir = 1;
				}
			}
			else
			{
				checkedWaypoint = true;
			}
		}
		else
		{
			checkedWaypoint = true;
		}
	}
	
	//Stage Jumping
	/*
	if (instance_exists(player_obj) && !jumpToNewDest && aggro && !attackInProg1) {
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

//Gravity
if (verspeed < 2)
{
	verspeed -= gravityStrength * global.dt;
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

//Frozen
if (frozen) {
	movSpeed = movSpeedSave / 2;
	image_blend = make_color_rgb(120, 120, 255);
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
		chip = choose(1,1,2)
		
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
	if (instance_exists(light))
	{
		instance_destroy(light);
	}
	if (instance_exists(dmgHitbox))
	{
		dmgHitbox.timer = -1;
	}
	
	var leg = instance_create_layer(x + 6, y + 3, "Instances", crawlerBodyPart_obj);
	leg.image_index = 0;
	var cannon = instance_create_layer(x, y - 6, "Instances", crawlerBodyPart_obj);
	cannon.image_index = 1;
	var head = instance_create_layer(x + 9, y - 2, "Instances", crawlerBodyPart_obj);
	head.image_index = 2;
	
	var amount = random_range(12, 18);
	repeat(amount) {
		instance_create_layer(x, y, "Instances", crawlerChunk_obj);
	}
	
	var amount2 = random_range(6, 12);
	repeat(amount2) {
		var blood = instance_create_layer(x + random_range(-22, 22), y + random_range(-8, 8), "Instances", bloodSpread2_obj);
		blood.image_xscale = choose(random_range(0.7, 1), random_range(-0.7, -1));
		blood.image_yscale = choose(random_range(0.7, 1), random_range(-0.7, -1));
	}
	
	instance_destroy();
}

if (damageTintTimer < 0)
{
	damageTintTimer = damageTintTimerSave;
	damageTint = false;
}

//Lever Delay
if (usedLever)
{
	useDelayTimer -= global.dt;
}
if (useDelayTimer < 0)
{
	usedLever = false;
	useDelayTimer = useDelayTimerSave;
}

//###Attack###

//Cooldown
if (aggro && checkedWaypoint)
{	
	if (!attackInProg1)
	{
		if (!frozen) {
			attackCooldown -= global.dt;
		} else {
			attackCooldown -= global.dt / 2;
		}
	
		if (attackCooldown < 0 && !attackInProg1)
		{
			attackInProg1 = true;
		}
	}
}

//Start Attack 1
if (attackInProg1)
{
	attack1PrepareTimer -= global.dt;
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
		
		if (!playedSound)
		{
			flameSound = audio_play_sound_on(emitter, flamethrower_snd, true, false);
			playedSound = true;
		}
	
		animationSpeed = 1.25;
		sprite_index = crawlerFireAttack_spr;
		delay1 = true;
		if (!instance_exists(dmgHitbox))
		{
			dmgHitbox = instance_create_layer(x + 37 * image_xscale, y - 48, "Instances", damageHitbox_obj);
			with (dmgHitbox)
			{
				body = instance_nearest(x, y, crawler_obj);
			}
			dmgHitbox.damage = 20;
			dmgHitbox.image_xscale = 1.5;
			dmgHitbox.image_yscale = 8;
			dmgHitbox.timer = attackDelay1;
		}
	
		if (!instance_exists(light))
		{
			light = instance_create_layer(x, y, "GraphicsLayer", spotlightYellow_obj);
		}
		with (light)
		{
			body = instance_nearest(x, y, crawler_obj);
		}
	}
}

//Start Attack 2
/*
if (attackInProg2)
{
	animationSpeed = 1.25;
	if (fireballInstance == noone)
	{
		fireballInstance = instance_create_layer(x, y - 46, "Instances", fireball_obj);
		fireballInstance.body = id;
	}
	sprite_index = crawlerFireAttack2_spr;
	delay2 = true;
	if (!playedSound)
	{
		flameSound = audio_play_sound_on(emitter, flamethrower_snd, true, false);
		audio_sound_pitch(flameSound, 0.8);
		playedSound = true;
	}
}
*/
	
if (delay1)
{
	attackDelay1 -= global.dt;
}
if (delay2)
{
	attackDelay2 -= global.dt;
}
if (attackDelay1 < 0 || attackDelay2 < 0)
{
	attackCooldown = attackCooldownSave;
	delay1 = false;
	attackDelay1 = attackDelay1Save;
	attackDelay2 = attackDelay2Save;
	attackInProg1 = false;
	attackInProg2 = false;
	attack1PrepareTimer = attack1PrepareTimerSave;
	animationSpeed = 1;
	sprite_index = crawler_spr;
	damageCollision = false;
	if (instance_exists(light))
	{
		instance_destroy(light);
	}
	if (instance_exists(dmgHitbox))
	{
		dmgHitbox.timer = -1;
	}
	dmgHitbox = noone;
	light = noone;
	playedSound = false;
	if (flameSound != noone)
	{
		audio_stop_sound(flameSound)
		flameSound = noone;
	}
}

if (instance_exists(body)) {
	if (instance_exists(light))
	{
		with (light)
		{
			light[| eLight.X] = body.x;
			light[| eLight.Y] = body.y;
		}
	}
	if (instance_exists(dmgHitbox))
	{
		with (dmgHitbox)
		{
			x = body.x + 37 * body.image_xscale;
			y = body.y - 48;
		}
	}
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

//Audio
if (audio_emitter_exists(emitter)) {
	audio_emitter_position(emitter, x, y, 0);
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

x += horspeed * global.dt;
y += verspeed * global.dt;
horspeed = movSpeedGrad;