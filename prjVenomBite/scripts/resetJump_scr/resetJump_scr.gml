player_obj.verspeed = 0;
player_obj.fullJump = false;
player_obj.shortjump = false;
player_obj.fallJumpSafety = fallJumpSafetySave;
player_obj.jumping = false;
player_obj.groundCollisionTimerOn = true;
if (verspeed >= 0)
{
	player_obj.grounded = true;
}
player_obj.wallJumps = player_obj.wallJumpsSave;
player_obj.wallJumpingInAir = false;
player_obj.invincible = false;
if (!landSoundPlayed)
{
	audio_play_sound(land_snd, 1, false);
	landSoundPlayed = true;
}