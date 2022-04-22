delay -= global.dt;

if (delay < 0) {
	instance_create_layer(x, y, "Instances", explosionBig_obj);
	instance_destroy();
}
