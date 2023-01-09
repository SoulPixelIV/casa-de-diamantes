if (global.warpzone1Reward && !global.warpzone1RewardGiven) {
	if (item == 2) {
		instance_create_layer(x, y - 24, "Instances", diamond_obj);
		//Check if last glass cabinet
		if (instance_number(glassCabinet_obj) == 1) {
			global.warpzone1RewardGiven = true;
		}
		instance_destroy();
	}
}




