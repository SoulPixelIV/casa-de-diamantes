player_obj.isDashing = true;
player_obj.dashDelay = player_obj.dashDelaySave;
image_index = 0;
//player_obj.movement = false;

player_obj.verspeed = -player_obj.jumpStrength / 1.3;
if (player_obj.dirCursor > 90 && player_obj.dirCursor < 270)
{
	player_obj.horspeed -= player_obj.dashSpeed;
}
else
{
	player_obj.horspeed += player_obj.dashSpeed;
}