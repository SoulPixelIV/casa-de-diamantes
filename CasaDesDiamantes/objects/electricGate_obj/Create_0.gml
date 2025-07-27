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

if (index == 0) {
	if (room == level16 && global.level16FloorGate) {
		open = true;
	}
}
if (index == 1) {
	if (room == level16 && global.level16Shortcut) {
		open = true;
	}
}
if (index == 2) {
	if (global.level19Shortcut1) {
		open = true;
	}
}
if (index == 3) {
	if (global.level21ExitGate) {
		open = true;
	}
}
if (index == 4) {
	if (global.level22Stage1Gate) {
		open = true;
	}
}
