draw_self();
draw_sprite_ext(lensflareBlue_spr, 0, x, y - 55, 2, 2, 0, -1, 1);

if (distance_to_object(player_obj) < 32)
{
	draw_set_font(global.optixFont);
	draw_set_color(c_white);
	draw_text(x - 32, y - 86, "Checkpoint!");
}
