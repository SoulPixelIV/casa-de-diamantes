/// @description Spawn enemies

//Find all spawns
spawnNumber = instance_number(battleArenaSpawn_obj);
for (var i = 0; i < spawnNumber; i++)
{
	if (place_meeting(x, y, instance_find(battleArenaSpawn_obj, i)))
	{
		selectedSpawn = instance_find(battleArenaSpawn_obj, i);
		if (selectedSpawn.spawnedEnemy == false && selectedSpawn.wave = wave)
		{
			instance_create_layer(selectedSpawn.x, selectedSpawn.y, "Instances", selectedSpawn.enemy);
			selectedSpawn.spawnedEnemy = true;
		}
	}
}
