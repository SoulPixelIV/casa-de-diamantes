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

//Mouse Cursor Controls
if (instance_exists(cursorHitboxLevelSelect_obj)) {
	for (var i = 0; i < instance_number(cursorHitboxLevelSelect_obj); ++i;) {
		var hitbox = instance_find(cursorHitboxLevelSelect_obj, i);
		if (instance_exists(hitbox)) {
			if (hitbox.open) {
				if (hitbox.index < 7) {
					cursorPos = hitbox.index;
				
					if (mouse_check_button_pressed(mb_left)) {
						if (menu == 0) {
							switch (cursorPos)
							{
								case 0:
									global.roomTeleportWish = level_Casino;
									room_goto(saveSelect);
								break;
								case 1:
									pushDelay = 70;
									menu = 1;
									cursorPos = 0;
								break;
								case 2:
									pushDelay = 70;
									menu = 2;
									cursorPos = 0;
								break;
								case 3:
									pushDelay = 70;
									menu = 3;
									cursorPos = 0;
								break;
								case 4:
									pushDelay = 70;
									menu = 5;
									cursorPos = 0;
								break;
								case 5:
									pushDelay = 70;
									menu = 6;
									cursorPos = 0;
								break;
								case 6:
									pushDelay = 70;
									menu = 7;
									cursorPos = 0;
								break;
							}
						} else if (menu == 1) {
							switch (cursorPos)
							{
								case 0:
									global.roomTeleportWish = level1;
									room_goto(saveSelect);
								break;
								case 1:
									global.roomTeleportWish = level2;
									room_goto(saveSelect);
								break;
								case 2:
									global.roomTeleportWish = level3;
									room_goto(saveSelect);
								break;
							}
						} else if (menu == 2) {
							switch (cursorPos)
							{
								case 0:
									global.roomTeleportWish = level4;
									room_goto(saveSelect);
								break;
								case 1:
									global.roomTeleportWish = level5A;
									room_goto(saveSelect);
								break;
								case 2:
									global.roomTeleportWish = level5B;
									room_goto(saveSelect);
								break;
								case 3:
									global.roomTeleportWish = level6;
									room_goto(saveSelect);
								break;
								case 4:
									global.roomTeleportWish = level7;
									room_goto(saveSelect);
								break;
								case 5:
									global.roomTeleportWish = level8;
									room_goto(saveSelect);
								break;
								case 6:
									global.roomTeleportWish = level9;
									room_goto(saveSelect);
								break;
							}
						} else if (menu == 3) {
							switch (cursorPos)
							{
								case 0:
									global.roomTeleportWish = level10;
									room_goto(saveSelect);
								break;
								case 1:
									global.roomTeleportWish = level11;
									room_goto(saveSelect);
								break;
								case 2:
									global.roomTeleportWish = level12;
									room_goto(saveSelect);
								break;
								case 3:
									global.roomTeleportWish = level13;
									room_goto(saveSelect);
								break;
								case 4:
									global.roomTeleportWish = level14;
									room_goto(saveSelect);
								break;
							}
						} else if (menu == 4) {
							switch (cursorPos)
							{
								case 0:
									global.roomTeleportWish = warpzone1;
									room_goto(saveSelect);
								break;
								case 1:
									global.roomTeleportWish = warpzone2;
									room_goto(saveSelect);
								break;
								case 2:
									global.roomTeleportWish = warpzone3;
									room_goto(saveSelect);
								break;
							}
						} else if (menu == 5) {
							switch (cursorPos)
							{
								case 0:
									global.roomTeleportWish = weaponRemove;
									room_goto(saveSelect);
								break;
								case 1:
									global.roomTeleportWish = level16;
									room_goto(saveSelect);
								break;
								case 2:
									global.roomTeleportWish = level17;
									room_goto(saveSelect);
								break;
								case 3:
									global.roomTeleportWish = level18;
									room_goto(saveSelect);
								break;
								case 4:
									global.roomTeleportWish = level19;
									room_goto(saveSelect);
								break;
							}
						} else if (menu == 6) {
							switch (cursorPos)
							{
								case 0:
									global.roomTeleportWish = level20;
									room_goto(saveSelect);
								break;
								case 1:
									global.roomTeleportWish = level21;
									room_goto(saveSelect);
								break;
								case 2:
									global.roomTeleportWish = level22;
									room_goto(saveSelect);
								break;
								case 3:
									global.roomTeleportWish = level23;
									room_goto(saveSelect);
								break;
								case 4:
									global.roomTeleportWish = level24;
									room_goto(saveSelect);
								break;
							}
						} else if (menu == 7) {
							switch (cursorPos)
							{
								case 0:
									global.roomTeleportWish = level_ConsumedCasino;
									room_goto(saveSelect);
								break;
								case 1:
									global.roomTeleportWish = level25;
									room_goto(saveSelect);
								break;
								case 2:
									global.roomTeleportWish = level26;
									room_goto(saveSelect);
								break;
								case 3:
									global.roomTeleportWish = level27;
									room_goto(saveSelect);
								break;
							}
						}
					}
				}
			}
		}
	}
}

//Mouse Cursor Controls 2
if (instance_exists(cursorHitboxLevelSelect2_obj)) {
	for (var i = 0; i < instance_number(cursorHitboxLevelSelect2_obj); ++i;) {
		var hitbox = instance_find(cursorHitboxLevelSelect2_obj, i);
		if (instance_exists(hitbox)) {
			if (hitbox.open) {
				if (hitbox.index < 7) {
					cursorPos = hitbox.index;
				
					if (mouse_check_button_pressed(mb_left)) {
						if (menu == 0) {
							switch (cursorPos)
							{
								case 0:
									global.roomTeleportWish = level_Casino;
									room_goto(saveSelect);
								break;
								case 1:
									pushDelay = 70;
									menu = 1;
									cursorPos = 0;
								break;
								case 2:
									pushDelay = 70;
									menu = 2;
									cursorPos = 0;
								break;
								case 3:
									pushDelay = 70;
									menu = 3;
									cursorPos = 0;
								break;
								case 4:
									pushDelay = 70;
									menu = 5;
									cursorPos = 0;
								break;
								case 5:
									pushDelay = 70;
									menu = 6;
									cursorPos = 0;
								break;
								case 6:
									pushDelay = 70;
									menu = 7;
									cursorPos = 0;
								break;
							}
						} else if (menu == 1) {
							switch (cursorPos)
							{
								case 0:
									global.roomTeleportWish = level1;
									room_goto(saveSelect);
								break;
								case 1:
									global.roomTeleportWish = level2;
									room_goto(saveSelect);
								break;
								case 2:
									global.roomTeleportWish = level3;
									room_goto(saveSelect);
								break;
							}
						} else if (menu == 2) {
							switch (cursorPos)
							{
								case 0:
									global.roomTeleportWish = level4;
									room_goto(saveSelect);
								break;
								case 1:
									global.roomTeleportWish = level5A;
									room_goto(saveSelect);
								break;
								case 2:
									global.roomTeleportWish = level5B;
									room_goto(saveSelect);
								break;
								case 3:
									global.roomTeleportWish = level6;
									room_goto(saveSelect);
								break;
								case 4:
									global.roomTeleportWish = level7;
									room_goto(saveSelect);
								break;
								case 5:
									global.roomTeleportWish = level8;
									room_goto(saveSelect);
								break;
								case 6:
									global.roomTeleportWish = level9;
									room_goto(saveSelect);
								break;
							}
						} else if (menu == 3) {
							switch (cursorPos)
							{
								case 0:
									global.roomTeleportWish = level10;
									room_goto(saveSelect);
								break;
								case 1:
									global.roomTeleportWish = level11;
									room_goto(saveSelect);
								break;
								case 2:
									global.roomTeleportWish = level12;
									room_goto(saveSelect);
								break;
								case 3:
									global.roomTeleportWish = level13;
									room_goto(saveSelect);
								break;
								case 4:
									global.roomTeleportWish = level14;
									room_goto(saveSelect);
								break;
							}
						} else if (menu == 4) {
							switch (cursorPos)
							{
								case 0:
									global.roomTeleportWish = warpzone1;
									room_goto(saveSelect);
								break;
								case 1:
									global.roomTeleportWish = warpzone2;
									room_goto(saveSelect);
								break;
								case 2:
									global.roomTeleportWish = warpzone3;
									room_goto(saveSelect);
								break;
							}
						} else if (menu == 5) {
							switch (cursorPos)
							{
								case 0:
									global.roomTeleportWish = weaponRemove;
									room_goto(saveSelect);
								break;
								case 1:
									global.roomTeleportWish = level16;
									room_goto(saveSelect);
								break;
								case 2:
									global.roomTeleportWish = level17;
									room_goto(saveSelect);
								break;
								case 3:
									global.roomTeleportWish = level18;
									room_goto(saveSelect);
								break;
								case 4:
									global.roomTeleportWish = level19;
									room_goto(saveSelect);
								break;
							}
						} else if (menu == 6) {
							switch (cursorPos)
							{
								case 0:
									global.roomTeleportWish = level20;
									room_goto(saveSelect);
								break;
								case 1:
									global.roomTeleportWish = level21;
									room_goto(saveSelect);
								break;
								case 2:
									global.roomTeleportWish = level22;
									room_goto(saveSelect);
								break;
								case 3:
									global.roomTeleportWish = level23;
									room_goto(saveSelect);
								break;
								case 4:
									global.roomTeleportWish = level24;
									room_goto(saveSelect);
								break;
							}
						} else if (menu == 7) {
							switch (cursorPos)
							{
								case 0:
									global.roomTeleportWish = level_ConsumedCasino;
									room_goto(saveSelect);
								break;
								case 1:
									global.roomTeleportWish = level25;
									room_goto(saveSelect);
								break;
								case 2:
									global.roomTeleportWish = level26;
									room_goto(saveSelect);
								break;
								case 3:
									global.roomTeleportWish = level27;
									room_goto(saveSelect);
								break;
							}
						}
					}
				}
			}
		}
	}
}

if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu) || gamepad_button_check_pressed(4, gp_padu))
{
	if (cursorPos > 0)
	{
		cursorPos--;
	}
	else
	{
		cursorPos = options;
	}
}
if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd) || gamepad_button_check_pressed(4, gp_padd))
{
	if (cursorPos < options)
	{
		cursorPos++;
	}
	else
	{
		cursorPos = 0;
	}
}

if (menu == 0) {
	options = 6;
}
if (menu == 1) {
	options = 2;
}
if (menu == 2) {
	options = 6;
}
if (menu == 3) {
	options = 4;
}
if (menu == 4) {
	options = 2;
}
if (menu == 5) {
	options = 4;
}
if (menu == 6) {
	options = 4;
}
if (menu == 7) {
	options = 3;
}

if (pushDelay < 0) {
	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1))
	{
		if (menu == 0) {
			switch (cursorPos)
			{
				case 0:
					global.roomTeleportWish = level_Casino;
					room_goto(saveSelect);
				break;
				case 1:
					pushDelay = 70;
					menu = 1;
					cursorPos = 0;
				break;
				case 2:
					pushDelay = 70;
					menu = 2;
					cursorPos = 0;
				break;
				case 3:
					pushDelay = 70;
					menu = 3;
					cursorPos = 0;
				break;
				case 4:
					pushDelay = 70;
					menu = 5;
					cursorPos = 0;
				break;
				case 5:
					pushDelay = 70;
					menu = 6;
					cursorPos = 0;
				break;
				case 6:
					pushDelay = 70;
					menu = 7;
					cursorPos = 0;
				break;
			}
		} else if (menu == 1) {
			switch (cursorPos)
			{
				case 0:
					global.roomTeleportWish = level1;
					room_goto(saveSelect);
				break;
				case 1:
					global.roomTeleportWish = level2;
					room_goto(saveSelect);
				break;
				case 2:
					global.roomTeleportWish = level3;
					room_goto(saveSelect);
				break;
			}
		} else if (menu == 2) {
			switch (cursorPos)
			{
				case 0:
					global.roomTeleportWish = level4;
					room_goto(saveSelect);
				break;
				case 1:
					global.roomTeleportWish = level5A;
					room_goto(saveSelect);
				break;
				case 2:
					global.roomTeleportWish = level5B;
					room_goto(saveSelect);
				break;
				case 3:
					global.roomTeleportWish = level6;
					room_goto(saveSelect);
				break;
				case 4:
					global.roomTeleportWish = level7;
					room_goto(saveSelect);
				break;
				case 5:
					global.roomTeleportWish = level8;
					room_goto(saveSelect);
				break;
				case 6:
					global.roomTeleportWish = level9;
					room_goto(saveSelect);
				break;
			}
		} else if (menu == 3) {
			switch (cursorPos)
			{
				case 0:
					global.roomTeleportWish = level10;
					room_goto(saveSelect);
				break;
				case 1:
					global.roomTeleportWish = level11;
					room_goto(saveSelect);
				break;
				case 2:
					global.roomTeleportWish = level12;
					room_goto(saveSelect);
				break;
				case 3:
					global.roomTeleportWish = level13;
					room_goto(saveSelect);
				break;
				case 4:
					global.roomTeleportWish = level14;
					room_goto(saveSelect);
				break;
			}
		} else if (menu == 4) {
			switch (cursorPos)
			{
				case 0:
					global.roomTeleportWish = warpzone1;
					room_goto(saveSelect);
				break;
				case 1:
					global.roomTeleportWish = warpzone2;
					room_goto(saveSelect);
				break;
				case 2:
					global.roomTeleportWish = warpzone3;
					room_goto(saveSelect);
				break;
			}
		} else if (menu == 5) {
			switch (cursorPos)
			{
				case 0:
					global.roomTeleportWish = weaponRemove;
					room_goto(saveSelect);
				break;
				case 1:
					global.roomTeleportWish = level16;
					room_goto(saveSelect);
				break;
				case 2:
					global.roomTeleportWish = level17;
					room_goto(saveSelect);
				break;
				case 3:
					global.roomTeleportWish = level18;
					room_goto(saveSelect);
				break;
				case 4:
					global.roomTeleportWish = level19;
					room_goto(saveSelect);
				break;
			}
		} else if (menu == 6) {
			switch (cursorPos)
			{
				case 0:
					global.roomTeleportWish = level20;
					room_goto(saveSelect);
				break;
				case 1:
					global.roomTeleportWish = level21;
					room_goto(saveSelect);
				break;
				case 2:
					global.roomTeleportWish = level22;
					room_goto(saveSelect);
				break;
				case 3:
					global.roomTeleportWish = level23;
					room_goto(saveSelect);
				break;
				case 4:
					global.roomTeleportWish = level24;
					room_goto(saveSelect);
				break;
			}
		} else if (menu == 7) {
			switch (cursorPos)
			{
				case 0:
					global.roomTeleportWish = level_ConsumedCasino;
					room_goto(saveSelect);
				break;
				case 1:
					global.roomTeleportWish = level25;
					room_goto(saveSelect);
				break;
				case 2:
					global.roomTeleportWish = level26;
					room_goto(saveSelect);
				break;
				case 3:
					global.roomTeleportWish = level27;
					room_goto(saveSelect);
				break;
			}
		}
	}
}

if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(4, gp_face2) || gamepad_button_check_pressed(0, gp_face2)) {
	audio_play_sound(typewriterPush_snd, 1, false);
	if (menu == 0) {
		room_goto(mainmenu);
	} else {
		menu = 0;
	}
}

pushDelay -= global.dt;

var pad = -1;
if (gamepad_is_connected(0)) pad = 0;
else if (gamepad_is_connected(4)) pad = 4;

if (inputMethod != 0) {
	if (pad != -1) {
		var inputx = gamepad_axis_value(pad, gp_axislh);
		var inputy = gamepad_axis_value(pad, gp_axislv);
		
		// Deadzone, damit der Cursor nicht zittert:
		if (abs(inputx) < 0.2) inputx = 0;
		if (abs(inputy) < 0.2) inputy = 0;
	
		var cursorx = window_mouse_get_x() + inputx * scrollSpeed;
		var cursory = window_mouse_get_y() + inputy * scrollSpeed;
		
		cursorx = clamp(cursorx, 0, display_get_width());
		cursory = clamp(cursory, 0, display_get_height());
	
		window_mouse_set(cursorx, cursory);
	}
}