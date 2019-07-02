/// @description Slope Collision

if (keyboard_check(ord("D")) || keyboard_check(ord("A")) || verspeed > 0)
{
	if (!place_meeting(x, y + verspeed, colliderSideway_obj))
	{
	    while (place_free(x, y + sign(verspeed)))
	    {
	        y += sign(verspeed) * dt;
	    }
	    verspeed = 0;
	}
	else
	{
		verspeed = -3;
	}
}
else
{
	resetJump_scr();
}
onSlope = true;
