if (laserOn) {
	laserDelay -= global.dt;
}

if (laserDelay < 0 && laserDelay2 > 0) {
	image_alpha = 1;
	laserDelay2 -= global.dt;
}

if (laserDelay2 < 0) {
	image_alpha -= global.dt / 300;
}