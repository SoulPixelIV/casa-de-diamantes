//###OutsideSolid###
if (colliding)
{
	if (place_free(x, y))
	{
		savePosX = x;
		savePosY = y;
	}
	else
	{
		x = savePosX;
		y = savePosY;
		verSpeed = 0;
	}
}
