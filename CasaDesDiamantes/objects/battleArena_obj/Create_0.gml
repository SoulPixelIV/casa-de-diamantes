/// @description Enemy Count

wave = 0;
highestWave = 0;
done = false;
setWave = false;
countEnemies = false;
sectionCleared = false;
enemyNumber = instance_number(enemy_obj);
enemyCount = 0;
updatedEnemyCount = 0;
checkSpawners = false;
var enemyList;

checkEnemycountTimer = 100;
checkEnemycountTimerSave = checkEnemycountTimer;

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


