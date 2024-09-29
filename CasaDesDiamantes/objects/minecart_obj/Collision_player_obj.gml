if (enterDelay < 0) {
	if (player_obj.verspeed > 0)
	{
		inMinecart = true;
		player_obj.grounded = true;
		player_obj.sittingInMinecart = true;
	}

	if (!createdMinecart) {
		var background = instance_create_layer(x, y, "BackgroundObjects", minecartBackground_obj);
		if (image_xscale == -1) {
			background.image_xscale = -1;
		}
		sprite_index = minecartForeground_spr;
		createdMinecart = true;
	}
}
