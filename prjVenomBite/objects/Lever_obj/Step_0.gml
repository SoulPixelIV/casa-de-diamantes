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
		}
		if (instance_exists(gate2_obj))
		{
			gate2 = instance_nearest(x, y, gate2_obj);
		}
		
		if (instance_exists(gate_obj) && instance_exists(gate2_obj))
		{
			if (distance_to_object(gate) < distance_to_object(gate2))
			{
				gate.open = true;
			}
			else
			{
				gate2.open = true;
			}
		}
		else
		{
			if (instance_exists(gate_obj))
			{
				gate.open = true;
			}
			if (instance_exists(gate2_obj))
			{
				gate2.open = true;
			}
		}
	}
}
