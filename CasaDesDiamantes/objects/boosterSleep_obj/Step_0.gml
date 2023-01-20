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
