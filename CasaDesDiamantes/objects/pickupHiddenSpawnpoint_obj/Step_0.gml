if (createPickup)
{
	spawnedPickup = instance_create_layer(x, y, "Instances", spawnID);
	spawnedPickup.gotSpawned = true;
	
	createPickup = false;
}