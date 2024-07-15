if (laserOn) {
	laserDelay -= global.dt;
} else {
	image_alpha = 0;
	alphaVal = 600;
	laserDelay = 950;
	laserDelay2 = 160;
}

if (laserDelay < 0 && laserDelay2 > 0) {
	image_alpha = 1;
	laserDelay2 -= global.dt;
}

if (laserDelay2 < 0) {
	alphaVal -= global.dt;
	image_alpha = alphaVal / 600;
}