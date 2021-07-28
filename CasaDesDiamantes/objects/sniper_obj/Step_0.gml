lightrayRotation += global.dt / 3;

if (!gotSpawned)
{
	spawn = instance_create_layer(x, y, "Instances", pickupHiddenSpawnpoint_obj);
	spawn.spawnID = dualBarettas_obj;
	gotSpawned = true;
}