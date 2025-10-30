//Check for Controller or Keyboard
if (gamepad_button_check_pressed(4, gp_face1) || gamepad_button_check_pressed(0, gp_face1)
 || gamepad_axis_value(4, gp_axislh) < -0.4 || gamepad_axis_value(0, gp_axislh) < -0.4
  || gamepad_button_check(4, gp_padu) || gamepad_axis_value(4, gp_axislv) < -0.4 || gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislv) < -0.4
   || gamepad_button_check(4, gp_padu) || gamepad_axis_value(4, gp_axislv) < -0.4 || gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislv) < -0.4
    || gamepad_button_check(4, gp_padd) || gamepad_axis_value(4, gp_axislv) > 0.4 || gamepad_button_check(0, gp_padd) || gamepad_axis_value(0, gp_axislv) > 0.4
	 || gamepad_button_check_pressed(4, gp_shoulderrb) || gamepad_button_check_pressed(0, gp_shoulderrb)
	  || gamepad_button_check_pressed(4, gp_face2) || gamepad_button_check_pressed(0, gp_face2)
	   || gamepad_button_check_pressed(4, gp_face3) || gamepad_button_check_pressed(0, gp_face3)
	    || gamepad_button_check(4, gp_shoulderlb) || gamepad_button_check(0, gp_shoulderlb)
		 || gamepad_button_check_pressed(4, gp_start) || gamepad_button_check_pressed(0, gp_start))
{
	inputMethod = 1;
}
else if (keyboard_check_pressed(vk_anykey))
{
	inputMethod = 0;
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (keyboard_check_pressed(ord("J")))
{
	if (noHUD)
	{
		//noHUD = false;
	}
	else
	{
		//noHUD = true;
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