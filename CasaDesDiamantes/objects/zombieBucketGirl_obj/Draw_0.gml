/// @description Draw Level
draw_self();

if (distance_to_object(player_obj) < 130)
{
	draw_sprite(enemyPointer_spr, 0, x, y - 32);
	draw_sprite(lvl2_spr, 0, x, y - 48);
	draw_set_font(standard_fnt);
	draw_set_color(c_white);
}
