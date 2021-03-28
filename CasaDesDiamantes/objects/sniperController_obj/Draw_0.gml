if (enableShooting)
{
	if (shootDelay > 100)
	{
		draw_sprite(enemyCrosshair_spr, 0, sniperPosX, sniperPosY - 16);
	}
	else
	{
		draw_sprite(enemyCrosshairFlashing_spr, -1, sniperPosX, sniperPosY - 16);
	}
}

