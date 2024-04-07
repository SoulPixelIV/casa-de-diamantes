speedRecieved = false;
createdLight = false;
boostDelay = 50;

boostDelaySave = boostDelay;

bluelight = instance_create_layer(x, y, "GraphicsLayer", spotlightPink_obj);

animationSpeed = 0.5;

if (room == level5A && global.level5ABooster) {
	open = true;
}

if (room == level8 && global.level8Booster && index == 0) {
	open = true;
}

if (room == level8 && global.level8Booster2 && index == 1) {
	open = true;
}

if (room == level8 && global.level8Booster3 && index == 2) {
	open = true;
}

if (room == level13 && global.level13Booster && index == 3) {
	open = true;
}