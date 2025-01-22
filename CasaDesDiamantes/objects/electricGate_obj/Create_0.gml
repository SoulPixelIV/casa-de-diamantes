open = false;
goalX1 = x - 176;
goalX2 = x + 176;
goalY1 = y - 176;
goalY2 = y + 176;

originX = x;
originY = y;

if (room == level2 && global.level2Gate) {
	open = true;
}

if (room == level5B && global.level5BGate) {
	open = true;
}

if (room == level12 && global.level12Gate) {
	open = true;
}

if (room == level16 && global.level16Shortcut) {
	open = true;
}
