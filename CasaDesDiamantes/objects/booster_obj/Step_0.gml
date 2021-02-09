if (speedRecieved)
{
	boostDelay -= global.dt;
}

if (boostDelay < 0)
{
	speedRecieved = false;
	boostDelay = boostDelaySave;
}

if (open)
{
	sprite_index = boosterOn_spr;
}
