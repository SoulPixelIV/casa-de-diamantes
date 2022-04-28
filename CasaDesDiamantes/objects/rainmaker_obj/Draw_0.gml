draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle, blend, image_alpha);

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

draw_sprite(radioactiveShield_spr, 0, x, y);

if (damageTint) {
	blend = c_red;
	damageTintTimer -= global.dt;
} else {
	blend = image_blend;
}