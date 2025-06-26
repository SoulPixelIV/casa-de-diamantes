teleportTimer -= global.dt;

if (teleportTimer < 0) {
	global.spawn = 0;
	room_goto(level11);
}
