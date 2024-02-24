if (instance_exists(lightning_obj))
{
	startTimer -= global.dt;
}

if (startTimer < 0)
{
	sprite_index = senzelaBackgroundBright_spr;
	brightTimer -= global.dt;
}

if (brightTimer < 0)
{
	sprite_index = senzelaBackground_spr;
	brightTimer = brightTimerSave + random_range(-10, 10);
	startTimer = startTimerSave + random_range(-10, 10);
}

if (global.chromaticLevel > 0.5) {
	sprite_index = senzelaBackgroundBright_spr;
}
	