/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;
dirLookat = point_direction(x, y, player_obj.x, player_obj.y);

if (movement)
{
	if (distance_to_object(player_obj) < playerSightMax && distance_to_object(player_obj) > playerSightMin)
	{
		if (player_obj.x > x)
		{
			horspeed = movSpeed;
		}
		else
		{
			horspeed = -movSpeed;
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
	if (!attackInProg)
	{
		horspeed = 0;
	}
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
	if (randNum == 9)
	{
		player_obj.enemySlowmo = true;
		camera_obj.follow = deathCross;
	}

	//Drop Money
	var maxAmount = random_range(moneyDropMin, moneyDropMax);
	for (i = 0; i < maxAmount; i++)
	{
		chip = 1;
		
		if (chip == 1)
		{
			instance_create_layer(x, y - 16, "Instances", chipBluePickup_obj);
		}
	}
	
	instance_destroy();
}

//Headshot Hitbox
with (headshotHitbox)
{
	x = body.x;
	y = body.y - 16;
}

//###Attack###

//Cooldown
if (!attackInProg && !attackInProg2 && distance_to_object(player_obj) < 200)
{
	if (distance_to_object(player_obj) < 64)
	{
		//attackCooldown -= global.dt * 2;
	}
	else
	{
		//attackCooldown -= global.dt;
	}
}

//Prepare Attack
if (attackCooldown < 0)
{
	if (distance_to_object(player_obj) < 64)
	{
		sprite_index = zombieGirlAttack2_spr;
		movement = false;
		attackInProg2 = true;
	}
	else
	{
		sprite_index = zombieGirlAttack1_spr;
		movement = false;
		attackInProg = true;
	}
	attackCooldown = attackCooldownSave;
}

//Start Attack 1
if (attackInProg)
{
	instance_create_layer(x, y - 4, "ForegroundObjects", dustParticle_obj);
}
if (attackInProg && image_index > image_number - 1 && !dashed)
{
	image_speed = 0;
	damageCollision = true;
	//Front Dash
	if (player_obj.y > y - 32 && player_obj.y < y + 32)
	{
		frontDash_scr(id);
	}
	else
	{
		frontDash_scr(id);
	}
	dashed = true;
}

//Start Attack 2
if (attackInProg2 && image_index > image_number - 1 && !dashed)
{
	image_speed = 0;
	dashed = true;
	delay = true;
}	
if (attackInProg2 && image_index > 8 && !spawnedHitbox)
{
	var hitbox = instance_create_layer(x + (16 * image_xscale), y, "Instances", damageHitbox_obj);
	hitbox.image_yscale = 1.5;
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
	image_speed = 1;
	sprite_index = zombieGirl_spr;
	damageCollision = false;
	movement = true;
	spawnedHitbox = false;
}

if (damageTint)
{
	sprite_index = zombieGirlWoundedFlash_spr;
	damageTintTimer -= global.dt;
}
if (damageTintTimer < 0)
{
	sprite_index = zombieGirlWounded_spr;
	damageTintTimer = damageTintTimerSave;
	damageTint = false;
}