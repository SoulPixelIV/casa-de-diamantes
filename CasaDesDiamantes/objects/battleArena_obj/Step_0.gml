/// @description Spawn enemies

//Activate Spawnpoints
spawnNumber = instance_number(battleArenaSpawn_obj);
for (var i = 0; i < spawnNumber; i++)
{
	if (place_meeting(x, y, instance_find(battleArenaSpawn_obj, i)))
	{
		selectedSpawn = instance_find(battleArenaSpawn_obj, i);
		if (selectedSpawn.spawnedEnemy == false && selectedSpawn.wave = wave)
		{
			var spawnCloud = instance_create_layer(selectedSpawn.x, selectedSpawn.y, "Instances", spawnCloud_obj);
			spawnCloud.spawnObject = selectedSpawn.enemy;
			selectedSpawn.spawnedEnemy = true;
		}
	}
}

//Use Gates
//Close Gate
if ((place_meeting(x, y, player_obj) && updatedEnemyCount > 1) || instance_exists(spawnCloud_obj))
{
	if (instance_exists(objectAccess))
	{
		objectNumber = instance_number(objectAccess);
		for (var i = 0; i < objectNumber; i++)
		{
			selectedGate = instance_find(objectAccess, i);
			if (place_meeting(x, y, selectedGate))
			{
				selectedGate.open = true;
			}
		}
	}
}
//Open Gate
else
{
	if (instance_exists(objectAccess))
	{
		objectNumber = instance_number(objectAccess);
		for (var i = 0; i < objectNumber; i++)
		{
			selectedGate = instance_find(objectAccess, i);
			if (place_meeting(x, y, selectedGate))
			{
				selectedGate.open = false;
			}
		}
	}
}

//Count Enemies again
if (countEnemies)
{
	enemyCount = 0;
	var enemyList;

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
			enemyCount++;
		}
	}
	countEnemies = false;
}
setWave = false;