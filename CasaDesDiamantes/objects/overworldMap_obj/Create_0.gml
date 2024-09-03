worldText = "";

xScreenSize = 480;
yScreenSize = 270;
zoom = 2;
xWindowSize = xScreenSize * zoom;
yWindowSize = yScreenSize * zoom;
inputMethod = 0;

image_speed = 0;

//Select Image depending on progress ingame
if (global.act2Unlocked) {
	image_index = 1;
}
if (global.act3Unlocked) {
	image_index = 2;
}