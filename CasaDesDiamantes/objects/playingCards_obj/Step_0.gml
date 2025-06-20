if (mouse_x > x - 24 && mouse_x < x + 24)
{
	if (mouse_y > y - 24 && mouse_y < y + 24)
	{
		if (image_xscale < 1.5 && !blackJackCalc_obj.holdingCard)
		{
			//image_xscale += global.dt / 50;
			//image_yscale += global.dt / 50;
		}
		
		//Rotate Card
		if (mouse_check_button(mb_right)) {
			image_angle += global.dt / 3;
		}
		
		//Moving Card
		if (mouse_check_button_pressed(mb_left)) {
			if (!playedSound && isVisible) {
				if (!audio_is_playing(takingCard_snd)) {
					audio_play_sound(takingCard_snd, 1, false);
				}
				playedSound = true;
			}
		}
		
		if (mouse_check_button(mb_left))
		{
			if (!blackJackCalc_obj.holdingCard)
			{
				blackJackCalc_obj.holdingCard = true;
				target = true;
			}
		}
		else
		{
			if (playedSound && isVisible) {
				if (!audio_is_playing(placingCard_snd)) {
					audio_play_sound(placingCard_snd, 1, false);
				}
				playedSound = false;
			}
			blackJackCalc_obj.holdingCard = false;
			target = false;
		}
	}
	else
	{
		if (image_xscale > 1)
		{
			image_xscale -= global.dt / 50;
			image_yscale -= global.dt / 50;
		}
	}
}
else
{
	if (image_xscale > 1)
	{
		image_xscale -= global.dt / 50;
		image_yscale -= global.dt / 50;
	}
}

if (target)
{
	x = mouse_x;
	y = mouse_y;
}