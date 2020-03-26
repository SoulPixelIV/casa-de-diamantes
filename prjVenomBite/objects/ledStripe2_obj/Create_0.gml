/// @description Variables

lightSize = 7;
lightStrength = 0.7;

lightSizeSave = lightSize;

lensFlareXPos = [];
lensFlareYPos = [];
for (i = 0; i < 6; i++)
{
	lensFlareXPos[i] = random_range(x - 56, x + 56);
	lensFlareYPos[i] = random_range(y - 4, y + 4);
}