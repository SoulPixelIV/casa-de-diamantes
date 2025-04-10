//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

x += horspeed * global.dt / 3;
y += verspeed * global.dt / 3;

if (horspeed > 0)
{
	if (!place_meeting(x, y, slotblock_obj) && !place_meeting(x, y, slotblockBomb_obj) && !place_meeting(x, y, slotblockQuestion_obj) && !place_meeting(x, y, slotblockMoving_obj)) {
			horspeed -= 0.002 * global.dt / 3;
		}

		if (horspeed < 0.3)
		{
			horspeed = 0;
		}
	}
	else
	{
		if (!place_meeting(x, y, slotblock_obj) && !place_meeting(x, y, slotblockBomb_obj) && !place_meeting(x, y, slotblockQuestion_obj) && !place_meeting(x, y, slotblockMoving_obj)) {
			horspeed += 0.002 * global.dt / 3;
		}

	if (horspeed > -0.3)
	{
		horspeed = 0;
	}
}

//Gravity
if (verspeed < 14)
{
	verspeed -= gravityStrength * global.dt / 3;
}

//Collision
//horspeed
if (!place_free(x + horspeed, y))
{
    horspeed = 0;
} 
//verspeed
if (!place_free(x, y + verspeed))
{
    verspeed = 0;   
}