if (speedRecieved)
{
	boostDelay -= global.dt;
}

if (boostDelay < 0)
{
	speedRecieved = false;
	boostDelay = boostDelaySave;
}
