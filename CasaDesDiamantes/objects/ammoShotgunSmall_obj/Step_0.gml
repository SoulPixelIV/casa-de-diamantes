x += horspeed * global.dt;
y += verspeed * global.dt;

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