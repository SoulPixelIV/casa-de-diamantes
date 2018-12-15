/// @description Movement
dir = choose (0,1,2,3,4,5,6,7);
switch (dir) 
{
	case 0:
	    x += 0.1 * spd;
	    break;
	case 1:
	    x += 0.1 * spd;
		y += 0.1 * spd;
	    break;
	case 2:
	    y += 0.1 * spd;
	    break;
	case 3:
		y += 0.1 * spd;
	    x -= 0.1 * spd;
	    break;
	case 4:
	    x -= 0.1 * spd;
	    break;
	case 5:
		y -= 0.1 * spd;
	    x -= 0.1 * spd;
	    break;
	case 6:
	    y -= 0.1 * spd;
	    break;
	case 7:
	    x += 0.1 * spd;
		y += 0.1 * spd;
	    break;
}

//Light
if (!shrink)
{
	lightSize += choose(0.01, -0.01, 0);
	lightSize = clamp(lightSize, lightSize - (lightSize / 4), lightSize);
}

//Death
if (shrink)
{
	lightStrength -= 0.01;
}
if (lightStrength <= 0)
{
	instance_destroy();
}

