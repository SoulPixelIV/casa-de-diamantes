/// @description Spawn enemies

setWave = false;

//Start Soundtrack
if (place_meeting(x, y, player_obj)) {
	if (!playedMusic) {
		currMusic = audio_play_sound(choose(track1_msc), 1, true);
		audio_sound_gain(currMusic, 0, 0);
		audio_sound_gain(currMusic, 1, 5000);
	}
	playedMusic = true;
}

//Spawn wounded enemies
woundedSpawntimer -= global.dt;

if (spawnWoundedEnemies && woundedSpawntimer < 0)
{
	woundedCount = 0;
	woundedList[0] = noone;
	woundedNumber = instance_number(zombieGirlWounded_obj);
	for (var i = 0; i < woundedNumber; i++)
	{
		woundedList[i] = instance_find(zombieGirlWounded_obj, i);
	}

	//Count enemies
	for (var i = 0; i < woundedNumber; i++)
	{
		if (place_meeting(x, y, woundedList[i]))	
		{
			woundedCount++;
		}
	}
	
	//Spawn wounded zombie if necessary
	if (woundedCount == 0 && !done && place_meeting(x, y, player_obj))
	{
		randWoundedpoint = woundedpointList[irandom(woundedpointMaxNum-1)]
		if (instance_exists(randWoundedpoint)) {
			var spawnCloud = instance_create_layer(randWoundedpoint.x, randWoundedpoint.y, "Instances", spawnCloud_obj);
			spawnCloud.spawnObject = zombieGirlWounded_obj;
		}
	}
	
	woundedSpawntimer = woundedSpawntimerSave;
}

//Check if done
if (!place_meeting(x, y, enemy_obj) && !place_meeting(x, y, spawnCloud_obj))
{
	if (wave == highestWave && !setWave)
	{
		done = true;
	}
}

//Send arena message
if (done && !setArenaMessage) {
	camera_obj.arenaCompleteMessage = true;
	setArenaMessage = true;
	audio_sound_gain(currMusic, 0, 5000);
}

checkEnemycountTimer -= global.dt;
if (checkEnemycountTimer < 0)
{
	enemyNumber = instance_number(enemy_obj);
	
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
		
	//Use Gates
	//Close Gate
	if ((place_meeting(x, y, player_obj) && !done))
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
		if (instance_exists(objectAccessSpecificWave))
		{
			if (wave == specificWave)
			{
				objectNumber = instance_number(objectAccessSpecificWave);
				for (var i = 0; i < objectNumber; i++)
				{
					selectedGate = instance_find(objectAccessSpecificWave, i);
					if (place_meeting(x, y, selectedGate))
					{
						selectedGate.open = true;
					}
				}
			}
		}
	}
	//Open Gate
	if (done || !place_meeting(x, y, player_obj))
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
					//enemySlowmo = true;
					//camera_obj.follow = instance_nearest(x, y, deathCross_obj);
				}
			}
		}
		sectionCleared = true;
	}

	if (!onlySpawn)
	{
		if (place_meeting(x, y, player_obj))
		{
			if (enemyCount == 0 && !setWave && !instance_exists(spawnCloud_obj))
			{
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

	//Activate Spawnpoints
	spawnNumber = instance_number(battleArenaSpawn_obj);
	for (var i = 0; i < spawnNumber; i++)
	{
		if (place_meeting(x, y, instance_find(battleArenaSpawn_obj, i)))
		{
			selectedSpawn = instance_find(battleArenaSpawn_obj, i);
			if (selectedSpawn.spawnedEnemy == false && selectedSpawn.wave == wave)
			{
				var spawnCloud = instance_create_layer(selectedSpawn.x, selectedSpawn.y, "Instances", spawnCloud_obj);
				spawnCloud.spawnObject = selectedSpawn.enemy;
				selectedSpawn.spawnedEnemy = true;
			}
		}
	}
	checkEnemycountTimer = checkEnemycountTimerSave;
}