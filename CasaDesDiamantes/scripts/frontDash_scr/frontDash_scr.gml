function frontDash_scr(argument0) {
	var object = argument0;

	if (instance_exists(object))
	{
		object.horspeed = (object.movSpeed + object.boostSpeed) * object.image_xscale;
		object.delay = true;
	}


}
