if (!speedRecieved && open)
{
	resetJump_scr();
	other.verspeed -= boostStrengthY;
	other.horspeed -= boostStrengthX;
	other.onBooster = true;
	speedRecieved = true;
}
