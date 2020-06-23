if (player_obj.grounded || (player_obj.fallJumpSafety > 0 && !player_obj.grounded))
{
	player_obj.verspeed = -player_obj.jumpStrength;
	player_obj.jumpType = 1;
}
else
{
	player_obj.verspeed = -player_obj.jumpStrength / 1.4;
	player_obj.jumpType = 2;
}

if (player_obj.isDashing)
{
	player_obj.stoppedDashing = true;
}
player_obj.jumping = true;
if (!player_obj.isDashing)
{
	player_obj.image_index = 0;
}
audio_play_sound(jump_snd, 1, false);
landSoundPlayed = false;
