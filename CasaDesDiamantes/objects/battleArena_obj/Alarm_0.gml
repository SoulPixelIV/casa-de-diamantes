/// @description Check Enemy Count

var enemyList;
updatedEnemyCount = 0;

//Find all enemies
for (var i = 0; i < enemyNumber; i++)
{
	enemyList[i] = instance_find(enemy_obj, i);
}

//Count enemies
for (var i = 0; i < enemyNumber; i++)
{
	if (place_meeting(x, y, enemyList[i]))	
	{
		updatedEnemyCount++;
	}
}

if (!onlySpawn)
{
	if (updatedEnemyCount < enemyCount / 2 && !setWave && !countEnemies && !instance_exists(spawnCloud_obj))
	{
		//Find all spawns
		spawnNumber = instance_number(battleArenaSpawn_obj);
		for (var i = 0; i < spawnNumber; i++)
		{
			if (place_meeting(x, y, instance_find(battleArenaSpawn_obj, i)))
			{
				selectedSpawn = instance_find(battleArenaSpawn_obj, i);
				if (selectedSpawn.wave > wave)
				{
					wave++;
					setWave = true;
					break;
				}
			}
		}
	}
}
else
{
	if (instance_exists(player_obj))
	{
		if (spawnAtSpecificPoint)
		{
			var activateFromPlayer;
			activateFromPlayer = false;
			if (player_obj.inPlayerpoint)
			{
				with (player_obj)
				{
					if (place_meeting(x, y, other.id))
					{
						activateFromPlayer = true;
					}
				}
			}
			if (activateFromPlayer)
			{
				wave = 1;
			}
		}
		else
		{
			if (place_meeting(x, y, player_obj))
			{
				wave = 1;
			}
		}
	}
}

alarm[0] = 100;