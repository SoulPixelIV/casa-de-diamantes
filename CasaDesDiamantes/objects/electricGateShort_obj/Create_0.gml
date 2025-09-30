open = false;
goalX1 = x - 88;
goalX2 = x + 88;
goalY1 = y - 88;
goalY2 = y + 88;

originX = x;
originY = y;

if (index == 0) {
	if (global.level16BacktrackGate1) {
		open = true;
	}
}
if (index == 1) {
	if (global.level16BacktrackGate2) {
		open = true;
	}
}
if (index == 2) {
	if (global.level18SecretGate1) {
		open = true;
	}
}
if (index == 3) {
	if (global.level21WeaponGate) {
		open = true;
	}
}
if (index == 4) {
	if (global.level12Gate) {
		open = true;
	}
}