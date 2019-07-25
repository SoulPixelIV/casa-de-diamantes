/// @description Draw Level
draw_self();

if (distance_to_object(player_obj) < 130)
{
	draw_sprite(enemyPointer_spr, 0, x, y - 32);
	draw_set_font(standard_fnt);
	draw_text(x - 16, y - 60, "Lvl: " + string(level));
}
