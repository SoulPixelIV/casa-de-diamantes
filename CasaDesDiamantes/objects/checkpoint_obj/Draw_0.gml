draw_self();

if (image_index < 1)
{
	draw_sprite_ext(lensflareBlue_spr, 0, x, y - 49, 2, 2, 0, -1, 1);
	draw_sprite_ext(lensflareRed_spr, 0, x, y - 5, 2, 2, 0, -1, 1);
}
else
{
	draw_sprite_ext(lensflareRed_spr, 0, x, y - 49, 2, 2, 0, -1, 1);
	draw_sprite_ext(lensflareBlue_spr, 0, x, y - 5, 2, 2, 0, -1, 1);
}

if (distance_to_object(player_obj) < 32 && used)
{
	draw_set_font(global.optixFont);
	draw_set_color(c_white);
	draw_text(x - 32, y - 86, "Checkpoint!");
}

if (distance_to_object(player_obj) < 32 && (!used || active))
{
	draw_sprite(wKeyIcon_spr, 0, player_obj.x, player_obj.y - 32);
	if (timer1Sound < 0) {
		sprite_index = checkpointSpin_spr;
	} else {
		sprite_index = checkpointOutline_spr;
	}
}
else
{
	if (timer1Sound < 0) {
		sprite_index = checkpointSpin_spr;
	} else {
		sprite_index = checkpoint_spr;
	}
}