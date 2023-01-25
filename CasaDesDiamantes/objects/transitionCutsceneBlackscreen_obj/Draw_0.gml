draw_self();

timer -= global.dt;

if (timer < 0) {
	image_alpha += global.dt / 900;
}

if (image_alpha > 0.95) {
	audio_stop_all();
	room_goto(level1);
}




