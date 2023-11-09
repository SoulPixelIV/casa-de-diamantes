//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

teleportTimer -= global.dt;

x += global.dt / 1.7;
y -= global.dt / 12;

if (teleportTimer < 0) {
	if (global.moveToWorld == 0) {
		room_goto(level1);
	}
	if (global.moveToWorld == 1) {
		room_goto(level_Casino);
	}
	if (global.moveToWorld == 2) {
		room_goto(level4);
	}
	if (global.moveToWorld == 3) {
		room_goto(level10);
	}
}