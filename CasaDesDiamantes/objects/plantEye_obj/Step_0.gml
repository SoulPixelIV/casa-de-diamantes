//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (!fallingDone) {
	y += global.dt * 1.5;
	image_angle += (global.dt / 5) * dir;
} else {
	x += (global.dt / 60) * dir;
	image_angle += (global.dt / 15) * dir;
}

if (!place_free(x, y)) {
	fallingDone = true;
}

timer -= global.dt;

if (timer < 0)
{
	instance_change(plantRootsExplosion_obj, true);
}

//Audio
audio_emitter_position(emitter, x, y, 0);