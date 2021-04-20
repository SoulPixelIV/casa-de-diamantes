/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;
horspeed = movSpeedGrad;

//Sight Check
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
		playerAtAggroPoint = true;
	}
}

if (deaggroTimer < 0)
{
	aggro = false;
	deaggroTimer = deaggroTimerSave;
}
if (aggroTimer < 0)
{
	aggro = true;
	aggroTimer = aggroTimerSave;
}

if (aggro)
{
	if (dir == 0)
	{
		if (movSpeedGrad <= movSpeed)
		{
			movSpeedGrad += global.dt / 350;
		}
	}
	else
	{
		if (movSpeedGrad >= -movSpeed)
		{
			movSpeedGrad -= global.dt / 350;
		}
	}
	
	if (attackInProg2)
	{
		if (movSpeedGrad > 1)
		{
			movSpeedGrad -= global.dt / 200;
		}
		if (movSpeedGrad < -1)
		{
			movSpeedGrad += global.dt / 200;
		}
		if (movSpeedGrad < 1 && movSpeedGrad > -1)
		{
			movSpeedGrad = 0;
		}
	}
	
	if (playerAtAggroPoint)
	{
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
	}
}

//Gravity
if (verspeed < 2)
{
	verspeed -= gravityStrength * global.dt;
}

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

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

//###Death###
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
	var randDrop = choose(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,3,4)
	if (randDrop == 2)
	{
		instance_create_layer(x, y - 16, "Instances", healthpackPickup_obj);
	}
	if (randDrop == 3)
	{
		instance_create_layer(x, y - 16, "Instances", ammoPackPistolPickup_obj);
	}
	if (randDrop == 4)
	{
		instance_create_layer(x, y - 16, "Instances", ammoPackShotgunPickup_obj);
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
	damageTint = false;
	if (instance_exists(light))
	{
		instance_destroy(light);
	}
	if (instance_exists(dmgHitbox))
	{
		instance_destroy(dmgHitbox);
	}
	instance_change(zombieGirlDeath2_obj, true);
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
if (aggro)
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
	
	if (!attackInProg1 || !attackInProg2)
	{
		attackCooldown -= global.dt;
	
		if (attackCooldown < 0 && !attackInProg1 && !attackInProg2)
		{
			if (fireballInstance == noone && place_free(x, y - 46))
			{
				var attack = choose(1, 2);
				if (attack == 1)
				{
					attackInProg1 = true;
				}
				if (attack == 2)
				{
					attackInProg2 = true;
				}
			}
			else
			{
				attackInProg1 = true;
			}
		}
	}
}

//Prepare Attack
if (verspeed == 0 && attackInProg1 && !startFire)
{
	if (distance_to_object(player_obj) < 126)
	{
		animationSpeed = 0.2;
		sprite_index = crawlerFireAttackProgress_spr;
	}
	if (image_index > image_number - 1)
	{
		startFire = true;
	}
}

//Start Attack 1
if (attackInProg1 && startFire)
{
	animationSpeed = 1.25;
	sprite_index = crawlerFireAttack_spr;
	delay1 = true;
	if (!instance_exists(dmgHitbox))
	{
		dmgHitbox = instance_create_layer(x + 12, y, "Instances", damageHitbox_obj);
		with (dmgHitbox)
		{
			body = instance_nearest(x, y, crawler_obj);
		}
		dmgHitbox.damage = 20;
		dmgHitbox.image_xscale = 2;
		dmgHitbox.image_yscale = 1.5;
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

//Start Attack 2
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
}
	
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
	startFire = false;
	attackDelay1 = attackDelay1Save;
	attackDelay2 = attackDelay2Save;
	attackInProg1 = false;
	attackInProg2 = false;
	animationSpeed = 1;
	sprite_index = crawler_spr;
	damageCollision = false;
	if (instance_exists(light))
	{
		instance_destroy(light);
	}
	if (instance_exists(dmgHitbox))
	{
		instance_destroy(dmgHitbox);
	}
	dmgHitbox = noone;
	light = noone;
}

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
	if (dir == 0)
	{
		with (dmgHitbox)
		{
			x = body.x + 16;
			y = body.y;
		}
	}
	else
	{
		with (dmgHitbox)
		{
			x = body.x - 16;
			y = body.y;
		}
	}
}