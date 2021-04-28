/// @description Pickup

if (global.syringes < 4)
{
	global.syringes++;
	instance_destroy();
}
