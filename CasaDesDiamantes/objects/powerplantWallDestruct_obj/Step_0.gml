if (distance_to_object(player_obj) < 64)
{
	var expl = instance_create_layer(x, y, "Instances", explosionTiny_obj);
	expl.damage = 0;
	instance_destroy();
}
