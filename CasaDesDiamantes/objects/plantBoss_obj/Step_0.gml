if (startBattle) {
	if (damageTintTimer < 0)
	{
		damageTintTimer = damageTintTimerSave;
		damageTint = false;
	}

	attackTimer -= global.dt;

	if (attackTimer < 0) {
		with (plantBossVineSpawner_obj) {
			spawnVine = true;
		}
		attackTimer = attackTimerSave;
	}
}