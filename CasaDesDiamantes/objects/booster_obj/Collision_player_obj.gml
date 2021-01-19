if (!speedRecieved)
{
	resetJump_scr();
	other.verspeed -= boostStrength;
	other.onBooster = true;
	speedRecieved = true;
}
