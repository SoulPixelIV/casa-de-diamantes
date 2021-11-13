draw_self();

if (open) {
	sprite_index = alarmLamp_spr;
	draw_sprite_ext(alarmLight_spr, 0, x, y, 1, 1, lightRot, -1, 1);
} else {
	sprite_index = alarmLampOff_spr;
}