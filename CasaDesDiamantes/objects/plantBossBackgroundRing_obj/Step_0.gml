if (moveToSecondFloor) {
	if (!place_meeting(x, y, plantBossMoveCollider_obj)) {
		y += global.dt;
	}
}

image_angle += global.dt / 20;
