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
		if (instance_exists(bluelight))
		{
			bluelight = instance_create_layer(x, y, "GraphicsLayer", spotlightLightBlue_obj);
		}
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
