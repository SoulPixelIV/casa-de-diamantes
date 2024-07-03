//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (laserOn) {
	laserDelay -= global.dt;
} else {
	laserDelay = 950;
	sprite_index = powerplantBackground_spr;
}

if (laserDelay < 0) {
	sprite_index = powerplantBackgroundLaser_spr;
}