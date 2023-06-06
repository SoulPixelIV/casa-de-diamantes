randNum = choose(1,2);

repeat(randNum) {
	instance_create_layer(x, y, "Instances", ammoPackPistolDrop_obj);
}
instance_destroy(other);
instance_destroy();
