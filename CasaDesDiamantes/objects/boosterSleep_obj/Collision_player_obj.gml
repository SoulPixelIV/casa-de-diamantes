if (!speedRecieved && open)
{
	resetJump_scr();
	other.verspeed = boostStrengthY;
	other.horspeed = boostStrengthX;
	other.onBooster = true;
	other.boosterLockedMovement = true;
	other.boosterLockedMovementTimer = other.boosterLockedMovementTimerSave;
	speedRecieved = true;
}
