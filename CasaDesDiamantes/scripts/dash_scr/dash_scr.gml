function dash_scr() {
	player_obj.isDashing = true;
	player_obj.dashDelay = player_obj.dashDelaySave;

	player_obj.verspeed = -player_obj.jumpStrength / 2.5;
	if (player_obj.horspeed < 0)
	{
		player_obj.horspeed -= player_obj.dashSpeed;
	}
	if (player_obj.horspeed > 0)
	{
		player_obj.horspeed += player_obj.dashSpeed;
	}
}
