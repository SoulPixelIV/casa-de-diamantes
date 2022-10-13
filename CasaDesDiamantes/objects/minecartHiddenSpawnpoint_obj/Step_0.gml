if (createMinecart)
{
	instance_create_layer(x, y, "ForegroundObjects", minecartForeground_obj);
	instance_create_layer(x, y, "BackgroundObjects", minecartBackground_obj);
	createMinecart = false;
}