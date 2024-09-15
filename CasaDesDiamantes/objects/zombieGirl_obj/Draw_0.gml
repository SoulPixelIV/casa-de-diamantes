if (!damageTint && attackTint) {
	gpu_set_blendmode(bm_add);
	shader_set(shd_flash);
	shdAlpha = shader_get_uniform(shd_flash, "_alpha");
	shader_set_uniform_f(shdAlpha, 1);
}

if (!attackTint && damageTint) {
	gpu_set_blendmode(bm_add);
	shader_set(shd_flashWhite);
	shdAlpha = shader_get_uniform(shd_flashWhite, "_alpha");
	shader_set_uniform_f(shdAlpha, 1);
}

draw_self();

//Draw Aggro Mode
if (aggroTimer < aggroTimerSave && aggroTimer > 0 && !aggro)
{
	draw_sprite(questionmark_spr, 0, x, y - 32);
}
if (aggro && exclamationmarkTimer > 0)
{
	exclamationmarkTimer -= global.dt;
	draw_sprite(exclamationmark_spr, 0, x, y - 32);
}
if (frozen) {
	draw_sprite(frozenskull_spr, 0, x, y - 32);	
}

if (!aggro)
{
	exclamationmarkTimer = exclamationmarkTimerSave;
}

if (damageTint) {
	damageTintTimer -= global.dt;
}

if (buffed) {
	draw_sprite(buff_spr, 0, x, y);
}

shader_reset();
gpu_set_blendmode(bm_normal);