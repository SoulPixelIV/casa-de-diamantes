if (image_xscale > 1)
{
	image_xscale -= global.dt / 25;
}
if (image_yscale > 1)
{
	image_yscale -= global.dt / 25;
}

if (image_alpha < 1 && !vanish)
{
	image_alpha += global.dt / 120;
}

if (image_alpha > 0.98)
{
	vanish = true;
}

if (vanish)
{
	image_alpha -= global.dt / 400;
	if (image_alpha < 0.02)
	{
		instance_destroy();
	}
}

