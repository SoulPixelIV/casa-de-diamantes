if (!playedSound) {
	if (player_obj.grounded) {
		player_obj.movement = false;
		startCamera = true;
		initialDelayStart = true;
	}
}
