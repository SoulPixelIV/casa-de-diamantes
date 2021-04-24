//Find highest wave
if (!checkSpawners)
{
	spawnNumber = instance_number(battleArenaSpawn_obj);
	for (var i = 0; i < spawnNumber; i++)
	{
		if (place_meeting(x, y, instance_find(battleArenaSpawn_obj, i)))
		{
			selectedSpawn = instance_find(battleArenaSpawn_obj, i);
			if (selectedSpawn.wave > highestWave)
			{
				highestWave = selectedSpawn.wave;
			}
		}
	}
	checkSpawners = true;
}
