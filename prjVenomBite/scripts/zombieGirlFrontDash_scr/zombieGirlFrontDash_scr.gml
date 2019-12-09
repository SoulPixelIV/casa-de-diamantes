var object = argument0;

if (object.image_xscale == 1)
{
	object.horspeed = object.boostSpeed;
}
else
{
	object.horspeed = -object.boostSpeed;
}
if (object.horspeed < 0.3 || object.horspeed > -0.3)
{
	object.attackBoost = false;
	object.image_speed = 1;
	object.sprite_index = zombieGirl_spr;
	object.damageCollision = false;
	object.attackInProg = false;
}