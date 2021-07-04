aliveTimer = 2300;
image_alpha = 0;
animationSpeed = 0.75;

blueLight = instance_create_layer(x + 5, y - 94, "GraphicsLayer", spotlightBlue_obj);

with (blueLight)
{
	body = instance_nearest(x, y, laserbulletshield_obj);
}