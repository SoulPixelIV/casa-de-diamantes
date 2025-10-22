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
	
	global.vibrationDelay = 15;
	var pad = -1;
	if (gamepad_is_connected(0)) pad = 0;
	else if (gamepad_is_connected(4)) pad = 4;

	if (player_obj.inputMethod != 0) {
		if (pad != -1) {
			gamepad_set_vibration(pad, 0.8, 0.8);
		}
	}
}
