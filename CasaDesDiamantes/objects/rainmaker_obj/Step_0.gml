/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;

if (!gotSpawned)
{
	spawn = instance_create_layer(x, y, "Instances", enemyHiddenSpawnpoint_obj);
	spawn.hp = hp;
	spawn.aggroRange = aggroRange;
	spawn.spawnID = rainmaker_obj;
	spawn.dir = image_xscale;
	gotSpawned = true;
}

if (instance_exists(player_obj))
{
	dirLookat = point_direction(x, y, player_obj.x, player_obj.y);
}

if (attackCooldown > 120 && attackInProg1)
{
	playerPosX = player_obj.x;
	playerPosY = player_obj.y;
}

//Sight Check
if (!collision_line(x, y, player_obj.x, player_obj.y, collider_obj, false, true) && !collision_line(x, y, player_obj.x, player_obj.y, enemyVisionBlockZone_obj, false, true))
{
	if (collision_line(x, y, player_obj.x, player_obj.y, player_obj, false, true))
	{
		if (distance_to_point(player_obj.x, player_obj.y) < aggroRange)
		{
			if ((image_xscale == -1 && player_obj.x >= x) || (image_xscale == 1 && player_obj.x <= x))
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
		if (collision_circle(x, y, 8, collider_obj, false, true)) {
			verspeed = -movSpeed;
		}
		//Fly down to player
		if (x < player_obj.x + 128 && x > player_obj.x - 128) {
			if (y < player_obj.y - 132) {
				verspeed = movSpeed;
			}
		}
	}
	
	if (horspeed != 0)
	{
		sprite_index = rainmakerWalking_spr;
	}
	if (aggro)
	{
		if (x < player_obj.x + 128 && x > player_obj.x - 128 && horspeed == 0)
		{
			if (player_obj.x > x)
			{
				horspeed = movSpeed * 3;
			}
			else
			{
				horspeed = -movSpeed * 3;
			}
		}
		if (!collision_circle(x, y, 16, enemy_obj, false, true))
		{
			if (x > player_obj.x + 128)
			{
				horspeed = -movSpeed * 3;
			}
			if (x < player_obj.x - 128)
			{
				horspeed = movSpeed * 3;
			}
		}
		else
		{
			nextEnemy = instance_nearest(x, y, enemy_obj);
			horspeed = choose(movSpeed, -movSpeed);
			verspeed = choose(movSpeed, -movSpeed);
		}
		if (dirLookat > 90 && dirLookat < 270)
		{
			image_xscale = 1
		}
		else
		{
			image_xscale = -1
		}
	}
	else
	{
		horspeed = 0;
	}
}

//Jetpack
if (dir == 0)
{
	if (verspeed > -0.1)
	{
		verspeed -= global.dt / 800;
	}
	if (verspeed <= -0.1)
	{
		dir = 1;
	}
}
else
{
	if (verspeed < 0.1)
	{
		verspeed += global.dt / 800;
	}
	if (verspeed >= 0.1)
	{
		dir = 0;
	}
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
	if (randNum == 9)
	{
		player_obj.enemySlowmo = true;
		camera_obj.follow = deathCross;
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
		chip = choose(1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3);
		
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
	damageTint = false;
	damageTintHeadshot = false;
	attackCooldown = attackCooldownSave;
	if (instance_exists(toxicrain)) {
		instance_destroy(toxicrain);
	}
	instance_change(zombieSoldierGirlDeath1_obj, true);
}

//Attack
if (aggro)
{
	if (instance_exists(player_obj))
	{
		if (player_obj.movement)
		{
			attackCooldown -= global.dt;
		}
	}

	if (randAttack == 1)
	{
		attackInProg1 = true;
	}
	else
	{
		if (distance_to_object(enemy_obj) < 512)
		{
			attackInProg2 = true;
		}
	}

	if (attackCooldown < 0 && attackInProg1)
	{
		toxicrain = instance_create_layer(x, y + 16, "Instances", toxicrain_obj);	

		attackCooldown = random_range(attackCooldownSave / 1.5, attackCooldownSave);
		attackInProg1 = false;
		attackInProg2 = false;
		randAttack = 1;
	}
	if (attackCooldown < 0 && attackInProg2)
	{	
		
		
		attackCooldown = random_range(attackCooldownSave / 1.5, attackCooldownSave);
		attackInProg1 = false;
		attackInProg2 = false;
		randAttack = 1;
	}
}

if (damageTint && sprite_index != zombieSoldierGirlFlashHeadshot_spr)
{
	sprite_index = zombieSoldierGirlFlash_spr;
	damageTintTimer -= global.dt;
}
if (damageTintHeadshot && sprite_index != zombieSoldierGirlFlash_spr)
{
	//sprite_index = zombieSoldierGirlFlashHeadshot_spr;
	damageTintTimer -= global.dt;
}
if (damageTintTimer < 0)
{
	sprite_index = rainmaker_spr;
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

//Check for rain
if (instance_exists(toxicrain)) {
	toxicrain.x = x;
	toxicrain.y = y + 16;
}

//Sound Position
audio_emitter_position(emitter, x, y, 0);