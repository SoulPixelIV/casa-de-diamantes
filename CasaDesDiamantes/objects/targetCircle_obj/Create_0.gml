animationSpeed = 0.5;
rocket = noone;
randY = random_range(-24, 24);

if (place_free(x, y - 256 + randY))
{
	rocket = instance_create_layer(x, y - 256 + randY, "Instances", sensoryRocket_obj);
}
else if (place_free(x, y - 212 + randY))
{
	rocket = instance_create_layer(x, y - 212 + randY, "Instances", sensoryRocket_obj);
}
else
{
	instance_destroy();
}
