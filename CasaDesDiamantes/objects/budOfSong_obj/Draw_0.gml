if (damageTint && !attackTint) {
	gpu_set_blendmode(bm_add);
	shader_set(shd_flash);
	shdAlpha = shader_get_uniform(shd_flash, "_alpha");
	shader_set_uniform_f(shdAlpha, 1);
}

if (attackTint && !damageTint) {
	gpu_set_blendmode(bm_add);
	shader_set(shd_flashWhite);
	shdAlpha = shader_get_uniform(shd_flashWhite, "_alpha");
	shader_set_uniform_f(shdAlpha, 1);
}

draw_self();

if (damageTint) {
	damageTintTimer -= global.dt;
}

if (buffScale > 1.1) {
	buffDir = -1;
}
if (buffScale < 0.9) {
	buffDir = 1;
}
if (buffDir = 1) {
	buffScale += global.dt / 200;
} else {
	buffScale -= global.dt / 200;
}

shader_reset();
gpu_set_blendmode(bm_normal);

buffRot += global.dt / 200;
draw_sprite_ext(buffZone_spr, 0, x, y - 22, 1, 1, buffRot, -1, buffScale / 2);

//Draw Aggro Mode
if (aggroTimer < aggroTimerSave && aggroTimer > 0 && !aggro)
{
	draw_sprite(questionmark_spr, 0, x, y - 55);
}
if (aggro && exclamationmarkTimer > 0)
{
	exclamationmarkTimer -= global.dt;
	draw_sprite(exclamationmark_spr, 0, x, y - 55);
}
if (frozen) {
	draw_sprite(frozenskull_spr, 0, x, y - 55);	
}
if (!aggro)
{
	exclamationmarkTimer = exclamationmarkTimerSave;
}