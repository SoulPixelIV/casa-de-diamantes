if (moveToSecondFloor) {
	if (!place_meeting(x, y, plantBossMoveCollider_obj)) {
		y += global.dt / 1.5;
	}
}
