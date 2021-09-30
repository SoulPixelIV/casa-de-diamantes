x += horspeed * global.dt;
y += verspeed * global.dt;
image_angle += global.dt / 2;

destroyTimer -= global.dt;
soundTimer -= global.dt;

//Gravity
if (verspeed < 2)
{
	verspeed -= gravityStrength * global.dt / 3;
}

//Collision
//horspeed
if (!place_free(x + horspeed, y))
{
    horspeed = -horspeed / 2;
} 
//verspeed
if (!place_free(x, y + verspeed))
{
    verspeed = -verspeed / 2;   
	if (soundTimer < 0 && (verspeed > 0.1 || verspeed < -0.1)) {
	var snd = audio_play_sound(choose(shotgunShellDrop1_snd, shotgunShellDrop2_snd), 1, false);
	audio_sound_pitch(snd, random_range(0.9, 1.1));
	soundTimer = soundTimerSave;
	}
}

if (destroyTimer < 0)
{
	image_alpha -= global.dt / 100;
	if (image_alpha < 0.05)
	{
		instance_destroy();
	}
}