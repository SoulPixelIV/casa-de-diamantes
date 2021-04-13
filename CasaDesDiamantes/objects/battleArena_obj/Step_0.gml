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
if ((place_meeting(x, y, player_obj) && updatedEnemyCount > 0) || instance_exists(spawnCloud_obj) && place_meeting(x, y, player_obj))
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
	if (instance_exists(objectAccess2))
	{
		objectNumber = instance_number(objectAccess2);
		for (var i = 0; i < objectNumber; i++)
		{
			selectedGate = instance_find(objectAccess2, i);
			if (place_meeting(x, y, selectedGate))
			{
				selectedGate.open = true;
			}
		}
	}
}
//Open Gate
if (updatedEnemyCount <= 0 && wave == highestWave || !place_meeting(x, y, player_obj))
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
	if (instance_exists(objectAccess2))
	{
		objectNumber = instance_number(objectAccess2);
		for (var i = 0; i < objectNumber; i++)
		{
			selectedGate = instance_find(objectAccess2, i);
			if (place_meeting(x, y, selectedGate))
			{
				selectedGate.open = false;
			}
		}
	}
	if (!sectionCleared)
	{
		with (player_obj)
		{
			if (instance_exists(deathCross_obj))
			{
				enemySlowmo = true;
				camera_obj.follow = instance_nearest(x, y, deathCross_obj);
			}
		}
	}
	sectionCleared = true;
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

//Check if done
if (!place_meeting(x, y, enemy_obj) && !place_meeting(x, y, spawnCloud_obj))
{
	if (wave == highestWave && !setWave)
	{
		done = true;
	}
}