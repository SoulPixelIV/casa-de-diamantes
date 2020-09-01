/// @description Movement

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;
dir = choose (0,1,2,3,4,5,6,7,8,9,10);
switch (dir) 
{
	case 0:
	    x += (0.1 * spd) * dt;
	    break;
	case 1:
	    x += (0.1 * spd) * dt;
		y += (0.1 * spd) * dt;
	    break;
	case 2:
	    y += (0.1 * spd) * dt;
	    break;
	case 3:
		y += (0.1 * spd) * dt;
	    x -= (0.1 * spd) * dt;
	    break;
	case 4:
	    x -= (0.1 * spd) * dt;
	    break;
	case 5:
		y -= (0.1 * spd) * dt;
	    x -= (0.1 * spd) * dt;
	    break;
	case 6:
	    y -= (0.1 * spd) * dt;
	    break;
	case 7:
	    x += (0.1 * spd) * dt;
		y += (0.1 * spd) * dt;
	    break;
	case 8:
	    x -= (0.1 * spd) * dt;
		y += (0.1 * spd) * dt;
	    break;
	case 9:
	    x -= (0.1 * spd) * dt;
	    break;
	case 10:
	    x -= (0.1 * spd) * dt;
		y -= (0.1 * spd) * dt;
	    break;
}

//Light
if (!shrink)
{
	lightSize += choose(0.01, -0.01, 0) * dt;
	lightSize = clamp(lightSize, lightSize - (lightSize / 4), lightSize);
}

//Death
lifespan -= dt;
if (lifespan < 0)
{
	shrink = true;
}
if (shrink)
{
	lightStrength -= 0.01 * dt;
}
if (lightStrength <= 0)
{
	instance_destroy();
}

