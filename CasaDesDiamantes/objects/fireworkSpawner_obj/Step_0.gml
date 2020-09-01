timerSpawn -= global.dt;

if (timerSpawn < 0)
{
	type = choose(0, 1, 2);
	fireworkEmitter = part_emitter_create(global.partSystem);
	part_emitter_region(global.partSystem, fireworkEmitter, x - 8, x + 8, y - 8, y + 8, ps_shape_ellipse, ps_distr_gaussian);

	if (type == 0)
	{
		part_emitter_burst(global.partSystem, fireworkEmitter, global.fireworkGreenPart, 250);
		light = instance_create_layer(x, y, "GraphicsLayer", spotlightGreen_obj);
	}
	if (type == 1)
	{
		part_emitter_burst(global.partSystem, fireworkEmitter, global.fireworkPinkPart, 250);
		light = instance_create_layer(x, y, "GraphicsLayer", spotlightPink_obj);
	}
	if (type == 2)
	{
		part_emitter_burst(global.partSystem, fireworkEmitter, global.fireworkBluePart, 250);
		light = instance_create_layer(x, y, "GraphicsLayer", spotlightBlue_obj);
	}
			
	part_emitter_destroy(global.partSystem, fireworkEmitter);
	
	timerSpawn = random_range(200, 600);
	lightSpawned = true;
}

if (lightSpawned)
{
	timerDelete -= global.dt;
}

if (timerDelete < 0)
{
	instance_destroy(light);
	timerDelete = timerDeleteSave;
	lightSpawned = false;
}