enum wave1 {
	zombieGirl = 3,
	zombieGirlWounded = 2
}
enum wave2 {
	zombieGirl = 7,
	zombieGirlWounded = 4,
	zombieSoldierGirl = 1
}
enum wave3 {
	zombieGirl = 12,
	zombieGirlWounded = 6,
	zombieSoldierGirl = 3
}

array_create(100, playerSpawners);

for (i = 0; i < instance_number(hordemodeSpawnpointPlayer_obj); i += 1)
{
	playerSpawners[i] = instance_find(hordemodeSpawnpointPlayer_obj,i);
}