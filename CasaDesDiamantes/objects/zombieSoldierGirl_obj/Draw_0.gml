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

//Vision line
if (attackCooldown < 160 && !attackInProg2 && distance_to_object(player_obj) < aggroRangeX && player_obj.y > y - 64 && player_obj.y < y + aggroRangeY)
{
	if (image_xscale == 1)
	{
		if (attackCooldown > 30)
		{
			draw_line_width_color(x + 15, y, playerPosX, playerPosY, 0.8, c_red, c_red);
		}
		else
		{
			draw_line_width_color(x + 15, y, playerPosX, playerPosY, 0.8, lineColor, lineColor);
		}
	}
	if (image_xscale == -1)
	{
		if (attackCooldown > 30)
		{
			draw_line_width_color(x - 15, y, playerPosX, playerPosY, 0.8, c_red, c_red);
		}
		else
		{
			draw_line_width_color(x - 15, y, playerPosX, playerPosY, 0.8, lineColor, lineColor);
		}
	}
}

if (player_obj != noone)
{
	dirCursor = point_direction(x, y, player_obj.x, player_obj.y);
	if (attackCooldown < 160 && !attackInProg2)
	{
		draw_sprite_ext(zombieSoldierGirlGun_spr, 0, x + 2 * image_xscale, y - 3.6, 1, image_xscale, dirCursor, -1, 1);
	}
}