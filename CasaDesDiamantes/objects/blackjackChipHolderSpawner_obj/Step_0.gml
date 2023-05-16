if (spawning50) {
	repeat (10) {
		instance_create_layer(x + random_range(-25, 25), y + random_range(-12, 12), "GameManagerLayer", blackjackChip_obj);
	}
	spawning50 = false;
}
if (spawning500) {
	repeat (100) {
		instance_create_layer(x + random_range(-25, 25), y + random_range(-12, 12), "GameManagerLayer", blackjackChip_obj);
	}
	spawning500 = false;
}