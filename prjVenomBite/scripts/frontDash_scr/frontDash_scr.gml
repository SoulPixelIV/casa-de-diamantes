var object = argument0;
var boostSpeed = argument1;

if (object != noone)
{
	object.horspeed = boostSpeed * object.image_xscale;
	object.delay = true;
}