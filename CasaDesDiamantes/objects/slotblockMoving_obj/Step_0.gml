//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (vertOrHor == 0) {
	if (dir == 0) {
		x += global.dt;
	} else {
		x -= global.dt;
	}
} else {
	if (dir == 0) {
		y += global.dt;
	} else {
		y -= global.dt;
	}
}

if (delayOn) {
	delayTimer -= global.dt;
	
	if (delayTimer < 0) {
		delayTimer = 100;
		delayOn = false;
	}
}

if (used && !spawned && !spinDone)
{
	spinTimer -= global.dt;
	sprite_index = slotblockSpinning_spr;
	animationSpeed = 1;
}

if (spinTimer < 0)
{
	spinDone = true;
}

if (used && !spawned && spinDone)
{
	if (spawnElement1 != noone)
	{
		repeat(spawnNumber1)
		{
			instance_create_layer(x, y - 16, "Instances", spawnElement1);
		}
	}
	if (spawnElement2 != noone)
	{
		repeat(spawnNumber2)
		{
			instance_create_layer(x, y - 16, "Instances", spawnElement2);
		}
	}
	if (spawnElement3 != noone)
	{
		repeat(spawnNumber3)
		{
			instance_create_layer(x, y - 16, "Instances", spawnElement3);
		}
	}
	if (spawnElement4 != noone)
	{
		repeat(spawnNumber4)
		{
			instance_create_layer(x, y - 16, "Instances", spawnElement4);
		}
	}
	if (spawnElement5 != noone)
	{
		repeat(spawnNumber5)
		{
			instance_create_layer(x, y - 16, "Instances", spawnElement5);
		}
	}
	spawned = true;
	sprite_index = slotblockOff_spr;
	animationSpeed = 1;
}

