function death_scr() {
	camera_obj.noZoom = true;
	camera_obj.deathVignette = true;
	camera_obj.noHUD = true;
	camera_obj.drawInfectionText = true;
	player_obj.movement = false;

	//Add momentum
	var enemyPosition = instance_nearest(x, y, enemy_obj);
	var bulletPosition = instance_nearest(x, y, bulletZombieSoldierGirl_obj);

	if (instance_exists(bulletPosition) && (bulletPosition.x > player_obj.x - 32 && enemyPosition.x < player_obj.x + 32))
	{
		player_obj.deathSlowmo = true;
		global.timeScale = 0.01;
		if (bulletPosition.x > player_obj.x)
		{
			player_obj.horspeed = -4;
			player_obj.verspeed = -1.5;
		}
		if (bulletPosition.x < player_obj.x)
		{
			player_obj.horspeed = 4;
			player_obj.verspeed = -1.5;
		}
	}
	else
	{
		/*
		if (enemyPosition.x > player_obj.x - 64 && enemyPosition.x < player_obj.x + 64)
		{
			player_obj.deathSlowmo = true;
			global.timeScale = 0.01;
			if (enemyPosition.x > player_obj.x)
			{
				player_obj.horspeed = -4;
				player_obj.verspeed = -1.5;
			}
			if (enemyPosition.x < player_obj.x)
			{
				player_obj.horspeed = 4;
				player_obj.verspeed = -1.5;
			}
		}
		*/
	}


}
