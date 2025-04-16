if (dirXScale == 1) {
	image_xscale -= 0.0002;
}
if (dirXScale == -1) {
	image_xscale += 0.0002;
}

if (image_xscale < 0.975) {
	dirXScale = -1;
}
if (image_xscale > 1.025) {
	dirXScale = 1;
}

if (dirYScale == 1) {
	image_xscale -= 0.0001;
}
if (dirYScale == -1) {
	image_xscale += 0.0001;
}

if (image_yscale < 0.980) {
	dirYScale = -1;
}
if (image_yscale > 1.02) {
	dirYScale = 1;
}