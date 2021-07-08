draw_self();

//Draw Aggro Mode
if (aggroTimer < aggroTimerSave && aggroTimer > 0 && !aggro)
{
	draw_sprite(questionmark_spr, 0, x, y - 32);
}
if (aggro && exclamationmarkTimer > 0)
{
	exclamationmarkTimer -= global.dt;
	draw_sprite(exclamationmark_spr, 0, x, y - 32);
}
if (!aggro)
{
	exclamationmarkTimer = exclamationmarkTimerSave;
}

if (player_obj != noone)
{
	if (aggro)
	{
		if (attackCooldown > 120)
		{
			dirCursor = point_direction(x, y, player_obj.x, player_obj.y);
		}
	}
	else
	{
		if (image_xscale == 1)
		{
			dirCursor = 0;
		}
		else
		{
			dirCursor = 180;
		}
	}
	if (image_xscale == 1)
	{
		clamp(dirCursor, 90, 270);
	}
	else
	{
		clamp(dirCursor, 270, 90);
	}
}

//Defense Enemy
if (attackInProg2)
{
	if (instance_exists(defenseEnemy))
	{
		draw_sprite(bulletshield_spr, -1, defenseEnemy.x, defenseEnemy.y);
	}
}

//Draw shield
draw_sprite(rainmakershield_spr, -1, x, y);