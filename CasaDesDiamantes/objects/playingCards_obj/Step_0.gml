if (mouse_x > x - 24 && mouse_x < x + 24)
{
	if (mouse_y > y - 24 && mouse_y < y + 24)
	{
		if (image_xscale < 1.5 && !blackJackCalc_obj.holdingCard)
		{
			//image_xscale += global.dt / 50;
			//image_yscale += global.dt / 50;
		}
		
		//Moving Card
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

if (blackJackCalc_obj.finished)
{
	instance_destroy();
}