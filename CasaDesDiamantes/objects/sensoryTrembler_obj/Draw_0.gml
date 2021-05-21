draw_self();

if (horspeed == 0)
{
	draw_sprite_ext(sensoryTremblerBottom_spr, 0, x, y, image_xscale, 1, 0, -1, 1);
}
else
{
	draw_sprite_ext(sensoryTremblerBottomAnimated_spr, 2, x, y, image_xscale, 1, 0, -1, 1);
}