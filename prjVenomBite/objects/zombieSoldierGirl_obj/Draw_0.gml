/// @description Draw Level
draw_self();

if (distance_to_object(player_obj) < 130)
{
	draw_sprite(enemyPointer_spr, 0, x, y - 32);
	draw_set_font(standard_fnt);
	draw_text(x - 16, y - 60, "Lvl: " + string(level));
}

//Vision line
if (attackCooldown < 60)
{
	if (image_xscale == 1)
	{
		draw_line_width_color(x + 15, y - 4, player_obj.x, player_obj.y, 0.8, c_red, c_red);
	}
	if (image_xscale == -1)
	{
		draw_line_width_color(x - 15, y - 4, player_obj.x, player_obj.y, 0.8, c_red, c_red);
	}
}

if (player_obj != noone)
{
	dirCursor = point_direction(x, y, player_obj.x, player_obj.y);
	if (attackCooldown < 60)
	{
		draw_sprite_ext(zombieSoldierGirlGun_spr, 0, x + 2 * image_xscale, y - 3.6, 1, image_xscale, dirCursor, -1, 1);
	}
}
