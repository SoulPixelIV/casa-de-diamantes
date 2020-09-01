/// @description Pickup

if (player_obj.syringes < 4)
{
	player_obj.syringes++;
	instance_destroy();
}
