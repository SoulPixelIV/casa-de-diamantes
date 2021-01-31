/// @description Variables

lensFlareXPos = [];
lensFlareYPos = [];
for (i = 0; i < 6; i++)
{
	lensFlareXPos[i] = random_range(x - 56, x + 56);
	lensFlareYPos[i] = random_range(y - 4, y + 4);
}