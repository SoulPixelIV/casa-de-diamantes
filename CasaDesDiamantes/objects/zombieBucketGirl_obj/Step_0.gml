/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;

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
	if (aggro && distance_to_object(player_obj) > 24)
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
	
	//Destroy Bucket
	if (instance_exists(bucketHitbox))
	{
		instance_destroy(bucketHitbox);
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

//Bucket Hitbox
with (bucketHitbox)
{
	if (instance_exists(body))
	{
		if (x != body.x && y != body.y)
		{
			x = body.x;
			y = body.y - 16;
		}
	}
}

//Bucket Destruction
if (hpBucket < 0 && !playedSound)
{
	audio_play_sound(bucketBroken_snd, 1, false);
	playedSound = true;
	bucketRemoved = true;
	sprite_index = zombieBucketGirlBroken_spr;
	with (bucketHitbox)
	{
		instance_destroy();
	}
}

//###Attack###

if (aggro && !attackInProg1 && !attackInProg2)
{
	if (distance_to_object(player_obj) < 128) {
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
	if (randAttack == 2)
	{
		sprite_index = zombieBucketGirlAttack1_spr;
		movement = false;
		attackInProg1 = true;
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
			sprite_index = zombieBucketGirlAttack1Start_spr;
			
			//Push forward
			movement = true;
			if (image_xscale == 1) {
				horspeed = 1;
			} else {
				horspeed = -1;
			}
	
			if (snapHitboxDelay < 0) {
				hitboxFlowerAttack = instance_create_layer(x + (48 * image_xscale), y, "Instances", damageHitbox_obj);
				hitboxFlowerAttack.image_yscale = 3;
				hitboxFlowerAttack.image_xscale = 4;
				hitboxFlowerAttack.damage = damage;
				hitboxFlowerAttack.timer = 100;

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
	if (attackInProg2) {
		hitboxFlowerAttack.follow = true;
		hitboxFlowerAttack.followX = x;
		hitboxFlowerAttack.followY = y - 48;
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
	//movement = true;
	spawnedHitbox = false;
}

//Start Attack 2
if (attackInProg2 && image_index > image_number - 1)
{
	image_index = 0;
	instance_create_layer(x, y, "ForegroundObjects", forcefield_obj);
	attackInProg2 = false;
	randAttack = choose(1,2);
	//movement = true;
	if (bucketRemoved)
	{
		sprite_index = zombieBucketGirlBroken_spr;
	}
	else
	{
		sprite_index = zombieBucketGirl_spr;
	}
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