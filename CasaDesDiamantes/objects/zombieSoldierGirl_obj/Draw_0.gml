/// @description Draw Level
draw_self();

if (distance_to_object(player_obj) < 130)
{
	draw_sprite(enemyPointer_spr, 0, x, y - 32);
	draw_sprite(lvl1_spr, 0, x, y - 48);
	draw_set_font(standard_fnt);
	draw_set_color(c_white);
}

//Vision line
if (attackCooldown < 160 && distance_to_object(player_obj) < 300 && !attackInProg2)
{
	if (image_xscale == 1)
	{
		if (attackCooldown > 90)
		{
			draw_line_width_color(x + 15, y - 4, playerPosX, playerPosY, 0.8, c_red, c_red);
		}
		else
		{
			draw_line_width_color(x + 15, y - 4, playerPosX, playerPosY, 0.8, c_yellow, c_yellow);
		}
	}
	if (image_xscale == -1)
	{
		if (attackCooldown > 90)
		{
			draw_line_width_color(x - 15, y - 4, playerPosX, playerPosY, 0.8, c_red, c_red);
		}
		else
		{
			draw_line_width_color(x - 15, y - 4, playerPosX, playerPosY, 0.8, c_yellow, c_yellow);
		}
	}
}

if (player_obj != noone)
{
	dirCursor = point_direction(x, y, player_obj.x, player_obj.y);
	if (attackCooldown < 160)
	{
		draw_sprite_ext(zombieSoldierGirlGun_spr, 0, x + 2 * image_xscale, y - 3.6, 1, image_xscale, dirCursor, -1, 1);
	}
}
