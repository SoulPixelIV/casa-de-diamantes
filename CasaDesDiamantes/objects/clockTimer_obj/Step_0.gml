if (startTimer) {
	if (image_index < 30) {
		secondTimer -= global.dt;
		if (secondTimer < 0) {
			image_index += 1;
			secondTimer = secondTimerSave;
		}
	}
}
