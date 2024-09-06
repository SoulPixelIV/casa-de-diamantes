//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

teleportTimer -= global.dt;

x += global.dt / 2.3;
y += global.dt / 3.2;

if (teleportTimer < 0) {
	room_goto(level10);
}