speedRecieved = false;
createdLight = false;
boostDelay = 50;

boostDelaySave = boostDelay;

if (spawnLight)
{
	bluelight = instance_create_layer(x, y, "GraphicsLayer", spotlightLightBlue_obj);
}
else
{
	bluelight = noone;
}
