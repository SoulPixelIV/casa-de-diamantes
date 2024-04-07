if (speedRecieved)
{
	boostDelay -= global.dt;
}

if (boostDelay < 0)
{
	speedRecieved = false;
	boostDelay = boostDelaySave;
}

if (open)
{
	if (room == level5A) {
		global.level5ABooster = true;
	}	
	if (room == level8 && index == 0) {
		global.level8Booster = true;
	}	
	if (room == level8 && index == 1) {
		global.level8Booster2 = true;
	}	
	if (room == level8 && index == 2) {
		global.level8Booster3 = true;
	}
	if (room == level13 && index == 3) {
		global.level13Booster = true;
	}
		
	sprite_index = boosterOn_spr;
	
	if (!createdLight)
	{
		bluelight = instance_create_layer(x, y, "GraphicsLayer", spotlightLightBlue_obj);
		createdLight = true;
	}
}
else
{
	if (instance_exists(bluelight))
	{
		instance_destroy(bluelight);
	}
	createdLight = false;
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;
