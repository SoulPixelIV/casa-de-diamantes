if (!speedRecieved && open)
{
	audio_play_sound(jumpPad_snd, 1, false);
	resetJump_scr();
	other.verspeed = boostStrengthY;
	other.horspeed = boostStrengthX;
	other.onBooster = true;
	other.boosterLockedMovement = true;
	other.boosterLockedMovementTimer = other.boosterLockedMovementTimerSave;
	speedRecieved = true;
}
