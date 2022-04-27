draw_self();

//Draw Aggro Mode
if (aggroTimer < aggroTimerSave && aggroTimer > 0 && !aggro)
{
	draw_sprite(questionmark_spr, 0, x, y - 32);
}
if (aggro && exclamationmarkTimer > 0)
{
	exclamationmarkTimer -= global.dt;
	draw_sprite(exclamationmark_spr, 0, x, y - 32);
}
if (!aggro)
{
	exclamationmarkTimer = exclamationmarkTimerSave;
}

draw_text(x+30, y, string(snapHitboxDelay));