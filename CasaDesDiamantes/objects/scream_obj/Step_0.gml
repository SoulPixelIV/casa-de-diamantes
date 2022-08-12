scale += global.dt / 100;

image_xscale = scale;
image_yscale = scale;

if (scale > 1) {
	image_alpha -= global.dt / 50;
}

if (image_alpha < 0.1) {
	instance_destroy();
}

x = body.x;
y = body.y;


