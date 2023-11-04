/// @description Pickup

if (global.syringes < 5)
{
	global.syringes++;
	instance_destroy();
}
