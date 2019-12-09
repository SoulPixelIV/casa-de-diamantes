var object = argument0;

if (object.image_xscale == 1)
{
	object.horspeed = object.boostSpeed;
}
else
{
	object.horspeed = -object.boostSpeed;
}
object.delay = true;