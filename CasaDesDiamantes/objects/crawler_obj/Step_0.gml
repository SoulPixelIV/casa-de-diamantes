/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;
horspeed = movSpeedGrad;

//Aggro
if (distance_to_object(player_obj) < aggroRange)
{
	aggro = true;
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

if (dir == 0)
{
	image_xscale = 1;
}
else
{
	image_xscale = -1;
}

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
if (!attackInProg && !attackInProg2)
{
	attackCooldown -= global.dt;
}

//Prepare Attack
if (attackCooldown < 0 && verspeed == 0)
{
	if (distance_to_object(player_obj) < 126)
	{
		animationSpeed = 0.2;
		sprite_index = crawlerFireAttackProgress_spr;
		attackInProg = true;
	}
	attackCooldown = attackCooldownSave;
}

//Start Attack 1
if (attackInProg && image_index > image_number - 1)
{
	animationSpeed = 1.25;
	sprite_index = crawlerFireAttack_spr;
	delay = true;
	if (!instance_exists(hitbox))
	{
		hitbox = instance_create_layer(x + 12, y, "Instances", damageHitbox_obj);
		with (hitbox)
		{
			body = instance_nearest(x, y, crawler_obj);
		}
		hitbox.damage = 20;
		hitbox.image_xscale = 2;
		hitbox.image_yscale = 1.5;
		hitbox.timer = attackDelay;
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
	
if (delay)
{
	attackDelay -= global.dt;
}
if (attackDelay < 0)
{
	delay = false;
	attackDelay = attackDelaySave;
	attackInProg = false;
	attackInProg2 = false;
	animationSpeed = 1;
	sprite_index = crawler_spr;
	damageCollision = false;
	if (instance_exists(light))
	{
		instance_destroy(light);
	}
	if (instance_exists(hitbox))
	{
		instance_destroy(hitbox);
	}
	hitbox = noone;
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
if (instance_exists(hitbox))
{
	if (dir == 0)
	{
		with (hitbox)
		{
			x = body.x + 16;
			y = body.y;
		}
	}
	else
	{
		with (hitbox)
		{
			x = body.x - 16;
			y = body.y;
		}
	}
}