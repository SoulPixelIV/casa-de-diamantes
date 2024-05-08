if (moving) {
	y -= global.dt * 1.7;
} else {
	if (!open || (open && movedShortcut)) {
		if (y < startPos) {
			y += global.dt * 2;
		}
	}
}

if (instance_exists(player_obj)) {
	if (!player_obj.onSpringLadder) {
		moving = false;
	}
}

if (global.level15Spring && index == 1) {
	open = true;
}

if (shortcut && open && !movedShortcut) {
	y += global.dt * 1.2;
	startPos = y;
}




