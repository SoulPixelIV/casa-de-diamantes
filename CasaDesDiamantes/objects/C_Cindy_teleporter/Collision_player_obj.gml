if (instance_exists(arrowDown_obj)) {
	arrow = instance_nearest(x, y, arrowDown_obj);
	instance_destroy(arrow);
}

teleporting = true;
player_obj.movement = false;
