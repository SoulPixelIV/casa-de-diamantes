open = false;
goalX1 = x - 88;
goalX2 = x + 88;
goalY1 = y - 88;
goalY2 = y + 88;

originX = x;
originY = y;

if (index == 2) {
	if (global.level16ArenaGate) {
		open = true;
	}
}
if (index == 3) {
	if (global.level18SecretGate2) {
		open = true;
	}
}
if (index == 4) {
	if (global.level21MainGate) {
		open = true;
	}
}
if (index == 5) {
	if (global.level22Stage2Gate) {
		open = true;
	}
}