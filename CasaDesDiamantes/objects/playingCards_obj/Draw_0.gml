if (backgroundCard) {
	if (blackJackCalc_obj.screen == 0 || blackJackCalc_obj.screen == 1 || blackJackCalc_obj.screen == 2) {
		draw_self();
		isVisible = true;
	} else {
		isVisible = false;
	}
} else {
	draw_self();
	isVisible = true;
}