/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;

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
if (horspeed != 0 && !attackInProg) {
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

//###Death###
if (hp < 0)
{
	var deathCross = instance_create_layer(x, y - 8, "ForegroundObjects", deathCross_obj);
	with (headshotHitbox)
	{
		instance_destroy();
	}
	
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
		chip = choose(1,1,1,1,2)
		
		if (chip == 1)
		{
			instance_create_layer(x, y - 16, "Instances", chipBluePickup_obj);
		}
		if (chip == 2)
		{
			instance_create_layer(x, y - 16, "Instances", chipRedPickup_obj);
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
		instance_create_layer(x, y, "Instances", zombiegirlHead_obj);
		var rand = choose(0,4);
		repeat (rand)
		{
			instance_create_layer(x, y, "Instances", zombiegirlPiece_obj);
		}
		instance_change(zombieGirlDeath1_obj, true);
	}
	else
	{
		instance_change(zombieGirlDeath2_obj, true);
	}
}

//Remove Arm
if (lostArm && !spawnedArm)
{
	sprite_index = zombieGirl_spr;
	//sprite_index = zombieGirlNoArm_spr;
	instance_create_layer(x, y, "Instances", zombiegirlArm_obj);
	spawnedArm = true;
}

//Headshot Hitbox
if (instance_exists(headshotHitbox))
{
	with (headshotHitbox)
	{
		if (instance_exists(body))
		{
			x = body.x;
			y = body.y - 16;
		}
	}
}

//###Attack###

//Cooldown
if (!attackInProg && !attackInProg2 && aggro)
{
	if (distance_to_object(player_obj) < 128) {
		attackCooldown -= global.dt;
	}
}

//Prepare Attack
if (attackCooldown < 0)
{
	if (distance_to_object(player_obj) < 128) {
		sprite_index = zombieGirlAttack1_spr;
		movement = false;
		attackInProg = true;
	}

	attackCooldown = attackCooldownSave;
}

if (attackInProg) {
	//Stop every animation at last frame during attack1
	if (image_index > image_number - 1) {
		image_index = image_number - 1;
	}
	
	animationSpeed = 0.75;
	attack1PrepareTimer -= global.dt;
}

if (attackInProg)
{	
	if (attack1PrepareTimer < 0) {
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
	hitboxFlowerAttack.follow = true;
	hitboxFlowerAttack.followX = x + (48 * image_xscale);
	hitboxFlowerAttack.followY = y;
}

if (attackInProg && snapAttack && attack1StopTimer < 0) {
	sprite_index = zombieGirlAttack1Stop_spr;
}

//END Attack 1
if (attackInProg && sprite_index == zombieGirlAttack1Stop_spr && image_index = image_number -1) {
	attackDelay = attackDelaySave;
	attack1PrepareTimer = attack1PrepareTimerSave;
	attack1StopTimer = attack1StopTimerSave;
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

//Start Attack 2
if (attackInProg2 && image_index > image_number - 1 && !dashed)
{
	animationSpeed = 0;
	dashed = true;
	delay = true;
}	
if (attackInProg2 && image_index > 8 && !spawnedHitbox)
{
	var hitbox = instance_create_layer(x + (20 * image_xscale), y, "Instances", damageHitbox_obj);
	hitbox.image_yscale = 1.5;
	hitbox.image_xscale = 3;
	hitbox.damage = 30;
	hitbox.timer = 140;
	spawnedHitbox = true;
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
		sprite_index = zombieGirl_spr;
		//sprite_index = zombieGirlNoArm_spr;
	}
	damageCollision = false;
	movement = true;
	spawnedHitbox = false;
}

if (damageTintTimer < 0)
{
	if (!lostArm)
	{
		sprite_index = zombieGirl_spr;
	}
	else
	{
		sprite_index = zombieGirl_spr;
		//sprite_index = zombieGirlNoArm_spr;
	}
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