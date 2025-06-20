invTimer -= global.dt;
despawnTimer -= global.dt;
if (despawnTimer < 0 || distance_to_object(player_obj) > 500)
{
	instance_destroy();
}

//Move towards player
if (distance_to_object(player_obj) < 32)
{
	follow = true;
}

if (follow) {
	if (distance_to_object(player_obj) < 256) {
		if (player_obj.x > x)
		{
			if (horspeed < 5) {
				horspeed += 0.1 * global.dt;
			}
		}
		else
		{
			if (horspeed > -5) {
				horspeed += -0.1 * global.dt;
			}
		}
	
		if (player_obj.y > y)
		{
			if (verspeed < 5) {
				verspeed += 0.1 * global.dt;
			}
		}
		else
		{
			if (verspeed > -5) {
				verspeed += -0.1 * global.dt;
			}
		}
	} else {
		instance_destroy();
	}
} else {
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
}

//Gravity
if (verspeed < 2)
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

//Animation
image_speed = 0;
image_index += global.dt / 30;

x += horspeed * global.dt / 3;
y += verspeed * global.dt / 3;