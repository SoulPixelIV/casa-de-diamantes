if (randNum == 2) {
	animationSpeed += global.dt / 8;
	if (pos != 0) {
		draw_sprite_ext(warninglaserLong_spr, animationSpeed, x, y, 1, 1, pos, -1, 1);
	}
}
draw_self();
