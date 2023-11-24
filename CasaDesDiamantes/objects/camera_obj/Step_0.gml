//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (keyboard_check_pressed(ord("J")))
{
	if (noHUD)
	{
		noHUD = false;
	}
	else
	{
		noHUD = true;
	}
}

/*
if (showWindowMenu)
{
	if (keyboard_check_pressed(vk_escape) || mouse_check_button_pressed(mb_left))
	{
		dialogueLine++;
		showWindowMenu = false;
	}
} */

//Check Culling Area
if (!deathInProg) {
	if (room != infiniteSpawn) {
		checkCullingAreaTimer -= global.dt;
		if (checkCullingAreaTimer < 0)
		{
			with (deactivate_obj)
			{
				if (!place_meeting(x, y, battleArena_obj))
				{
					instance_deactivate_object(self);
				}
			}
			//128px Safezone
			instance_activate_region((x - xScreenSize / 2) - 384, (y - yScreenSize / 2) - 384, xScreenSize + 768, yScreenSize + 768, true);
			checkCullingAreaTimer = checkCullingAreaTimerSave;
		}
	}
} else {
	instance_activate_all();
}