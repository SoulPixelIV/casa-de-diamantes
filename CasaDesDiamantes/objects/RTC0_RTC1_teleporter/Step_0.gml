if (distance_to_object(player_obj) < 24) {
	if (!open) {
		camera_obj.drawDiningEntranceText = true;
	} else {
		camera_obj.drawDiningEntranceText = false;
	}
} else {
	camera_obj.drawDiningEntranceText = false;
}
