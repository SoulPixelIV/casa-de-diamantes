/// @description Check Player

if (distance_to_object(player_obj) < 32)
{
	if (keyboard_check_pressed(ord("F")))
	{
		image_index = 1;
		used = true;
		
		if (instance_exists(gate_obj))
		{
			gate = instance_nearest(x, y, gate_obj);
			gate.open = true;
		}
	}
}
