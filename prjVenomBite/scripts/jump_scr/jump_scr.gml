if (player_obj.grounded)
{
	player_obj.verspeed = -player_obj.jumpStrength;
}
else
{
	player_obj.verspeed = -player_obj.jumpStrength / 1.4;
}

if (player_obj.isDashing)
{
	player_obj.stoppedDashing = true;
}
player_obj.jumping = true;