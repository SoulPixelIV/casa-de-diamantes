var object = argument0;

if (instance_exists(object))
{
	object.horspeed = object.boostSpeed * object.image_xscale;
	object.delay = true;
}