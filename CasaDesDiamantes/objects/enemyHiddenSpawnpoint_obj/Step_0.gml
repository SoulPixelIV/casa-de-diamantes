if (createEnemy)
{
	spawnedEnemy = instance_create_layer(x, y, "Instances", spawnID);
	spawnedEnemy.hp = hp;
	spawnedEnemy.aggroRange = aggroRange;
	spawnedEnemy.image_xscale = dir;
	spawnedEnemy.gotSpawned = true;
	
	createEnemy = false;
}