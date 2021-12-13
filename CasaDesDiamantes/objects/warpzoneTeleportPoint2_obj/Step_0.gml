if (delay < 0) {
	player_obj.movement = true;
}

if (playerEntered) {
	delay -= global.dt;
}

if (!place_meeting(x, y, player_obj)) {
	delay = delaySave;
	playerEntered = false;
}
