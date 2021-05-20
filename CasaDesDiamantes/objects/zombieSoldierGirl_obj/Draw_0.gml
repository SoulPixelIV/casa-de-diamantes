draw_self();

//Change line color
lineFlashTimer -= global.dt;
if (lineFlashTimer < 0)
{
	if (lineColor == c_yellow)
	{
		lineColor = c_red;
	}
	else
	{
		lineColor = c_yellow;
	}
	lineFlashTimer = lineFlashTimerSave;
}

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

//Vision line
if (attackCooldown < 300 && !attackInProg2 && aggro)
{
	if ((image_xscale == 1 && player_obj.x > x) || (image_xscale == -1 && player_obj.x < x))
	{
		if (attackCooldown > 120)
		{
			draw_sprite_ext(zombieSoldierGirlGunFlashing_spr, -1, x + 2 * image_xscale, y - 3.6, 1, image_xscale, dirCursor, -1, 1);
		}
		else
		{
			draw_sprite_ext(zombieSoldierGirlGun_spr, -1, x + 2 * image_xscale, y - 3.6, 1, image_xscale, dirCursor, -1, 1);
		}
	}
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