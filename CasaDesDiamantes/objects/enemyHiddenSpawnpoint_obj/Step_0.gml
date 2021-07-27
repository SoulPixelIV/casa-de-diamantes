if (createEnemy)
{
	spawnedEnemy = instance_create_layer(x, y, "Instances", spawnID);
	spawnedEnemy.gotSpawned = true;
	spawnedEnemy.hp = hp;
	spawnedEnemy.aggroRange = aggroRange;
	spawnedEnemy.image_xscale = dir;
	
	createEnemy = false;
}