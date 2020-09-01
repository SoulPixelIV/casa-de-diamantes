/// @description Check Enemy Count

var enemyList;
var updatedEnemyCount = 0;

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

if (updatedEnemyCount < enemyCount / 2)
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
			}
		}
	}
}

alarm[0] = 100;