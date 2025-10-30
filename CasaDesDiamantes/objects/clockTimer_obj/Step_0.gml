if (startTimer) {
	if (image_index < 40) {
		if (!global.pause) {
			secondTimer -= global.dt;
			if (secondTimer < 0) {
				image_index += 1;
				secondTimer = secondTimerSave;
			}
		}
	}
}
