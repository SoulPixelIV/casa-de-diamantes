/// @description Enemy Count

wave = 0;
highestWave = 0;
done = false;
setWave = false;
sectionCleared = false;
setArenaMessage = false;
enemyNumber = instance_number(enemy_obj);
enemyCount = 0;
checkSpawners = false;
woundedSpawntimer = 2600;
enemyList[0] = noone;
enemyList[1] = noone;

checkEnemycountTimer = 100;
checkEnemycountTimerSave = checkEnemycountTimer;
woundedSpawntimerSave = woundedSpawntimer;

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

//Find all wounded points
woundedpointList[0] = noone;
woundedpointNumber = instance_number(battleArenaWoundedpoint_obj);
woundedpointMaxNum = 0;
for (var i = 0; i < woundedpointNumber; i++)
{
	if (place_meeting(x, y, instance_find(battleArenaWoundedpoint_obj, i)))
	{
		woundedpointList[i] = instance_find(battleArenaWoundedpoint_obj, i);
		woundedpointMaxNum++;
	}
}


