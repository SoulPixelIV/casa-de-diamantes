if (open) {
	draw_self();
}

if (arrowNumber == 0) {
	if (global.arrowLevel2Done) {
		instance_destroy();
	}
}

if (arrowNumber == 1) {
	if (global.arrowVIPDone) {
		instance_destroy();
	}
}

if (arrowNumber == 2) {
	if (global.arrowCindyDone) {
		instance_destroy();
	}
}