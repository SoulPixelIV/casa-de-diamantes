x += horspeed * global.dt;
y += verspeed * global.dt;

destroyTimer -= global.dt;

//Gravity
if (verspeed < 2)
{
	verspeed -= gravityStrength * global.dt / 3;
}

//Collision
//horspeed
if (place_meeting(x + horspeed * global.dt, y, collider_obj))
{
    horspeed = -horspeed / 2.5;
} 
//verspeed
if (place_meeting(x, y + verspeed * global.dt, collider_obj))
{
    verspeed = -verspeed / 2.5;   
}

if (horspeed != 0)
{
	image_angle += global.dt / 2;
}

if (destroyTimer < 0)
{
	image_alpha -= global.dt / 100;
	if (image_alpha < 0.05)
	{
		instance_destroy();
	}
}