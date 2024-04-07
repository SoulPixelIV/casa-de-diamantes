open = false;
goalX1 = x - 176;
goalX2 = x + 176;
goalY1 = y - 176;
goalY2 = y + 176;

originX = x;
originY = y;

if (room == level5A && global.level5AGate) {
	open = true;
}

if (room == level5B && global.level5BGate2) {
	open = true;
}