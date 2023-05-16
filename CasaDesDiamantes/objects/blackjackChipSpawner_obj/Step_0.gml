if (blackJackCalc_obj.screen != 3) {
	spawnTimer -= global.dt;
}

if (spawnTimer < 0) {
	instance_create_layer(x + random_range(-45, 45), y, "ForegroundObjects", blackjackChip_obj);	
	spawnTimer = spawnTimerSave + random_range(-(spawnTimerSave / 2), spawnTimerSave / 2);
}
