draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle, make_color_rgb(255, 122, 122), image_alpha);

//Draw Aggro Mode
if (aggroTimer < aggroTimerSave && aggroTimer > 0 && !aggro)
{
	draw_sprite(questionmark_spr, 0, x + 8 * image_xscale, y - 32);
}
if (aggro && exclamationmarkTimer > 0)
{
	exclamationmarkTimer -= global.dt;
	draw_sprite(exclamationmark_spr, 0, x + 8 * image_xscale, y - 32);
}
if (!aggro)
{
	exclamationmarkTimer = exclamationmarkTimerSave;
}

if (damageTint) {
	blend = c_red;
	damageTintTimer -= global.dt;
} else {
	blend = image_blend;
}