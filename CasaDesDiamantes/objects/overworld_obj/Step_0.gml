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
									loadNoRoom_scr();
									room_goto(level_Casino);
									global.lastCheckpoint = noone;
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
									loadNoRoom_scr();
									room_goto(level1);
									global.lastCheckpoint = noone;
								break;
								case 1:
									loadNoRoom_scr();
									room_goto(level2);
									global.lastCheckpoint = noone;
								break;
								case 2:
									loadNoRoom_scr();
									room_goto(level3);
									global.lastCheckpoint = noone;
								break;
							}
						} else if (menu == 2) {
							switch (cursorPos)
							{
								case 0:
									loadNoRoom_scr();
									room_goto(level4);
									global.lastCheckpoint = noone;
								break;
								case 1:
									loadNoRoom_scr();
									room_goto(level5A);
									global.lastCheckpoint = noone;
								break;
								case 2:
									loadNoRoom_scr();
									room_goto(level5B);
									global.lastCheckpoint = noone;
								break;
								case 3:
									loadNoRoom_scr();
									room_goto(level6);
									global.lastCheckpoint = noone;
								break;
								case 4:
									loadNoRoom_scr();
									room_goto(level7);
									global.lastCheckpoint = noone;
								break;
								case 5:
									loadNoRoom_scr();
									room_goto(level8);
									global.lastCheckpoint = noone;
								break;
								case 6:
									loadNoRoom_scr();
									room_goto(level9);
									global.lastCheckpoint = noone;
								break;
							}
						} else if (menu == 3) {
							switch (cursorPos)
							{
								case 0:
									loadNoRoom_scr();
									room_goto(level10);
									global.lastCheckpoint = noone;
								break;
								case 1:
									loadNoRoom_scr();
									room_goto(level11);
									global.lastCheckpoint = noone;
								break;
								case 2:
									loadNoRoom_scr();
									room_goto(level12);
									global.lastCheckpoint = noone;
								break;
								case 3:
									loadNoRoom_scr();
									room_goto(level13);
									global.lastCheckpoint = noone;
								break;
								case 4:
									loadNoRoom_scr();
									room_goto(level14);
									global.lastCheckpoint = noone;
								break;
							}
						} else if (menu == 4) {
							switch (cursorPos)
							{
								case 0:
									loadNoRoom_scr();
									room_goto(warpzone1);
									global.lastCheckpoint = noone;
								break;
								case 1:
									loadNoRoom_scr();
									room_goto(warpzone2);
									global.lastCheckpoint = noone;
								break;
								case 2:
									loadNoRoom_scr();
									room_goto(warpzone3);
									global.lastCheckpoint = noone;
								break;
							}
						} else if (menu == 5) {
							switch (cursorPos)
							{
								case 0:
									loadNoRoom_scr();
									room_goto(weaponRemove);
									global.lastCheckpoint = noone;
								break;
								case 1:
									loadNoRoom_scr();
									room_goto(level16);
									global.lastCheckpoint = noone;
								break;
								case 2:
									loadNoRoom_scr();
									room_goto(level17);
									global.lastCheckpoint = noone;
								break;
								case 3:
									loadNoRoom_scr();
									room_goto(level18);
									global.lastCheckpoint = noone;
								break;
								case 4:
									loadNoRoom_scr();
									room_goto(level19);
									global.lastCheckpoint = noone;
								break;
							}
						} else if (menu == 6) {
							switch (cursorPos)
							{
								case 0:
									loadNoRoom_scr();
									room_goto(level20);
									global.lastCheckpoint = noone;
								break;
								case 1:
									loadNoRoom_scr();
									room_goto(level21);
									global.lastCheckpoint = noone;
								break;
								case 2:
									loadNoRoom_scr();
									room_goto(level22);
									global.lastCheckpoint = noone;
								break;
								case 3:
									loadNoRoom_scr();
									room_goto(level23);
									global.lastCheckpoint = noone;
								break;
								case 4:
									loadNoRoom_scr();
									room_goto(level24);
									global.lastCheckpoint = noone;
								break;
							}
						} else if (menu == 7) {
							switch (cursorPos)
							{
								case 0:
									loadNoRoom_scr();
									room_goto(level_ConsumedCasino);
									global.lastCheckpoint = noone;
								break;
								case 1:
									loadNoRoom_scr();
									room_goto(level25);
									global.lastCheckpoint = noone;
								break;
								case 2:
									loadNoRoom_scr();
									room_goto(level26);
									global.lastCheckpoint = noone;
								break;
								case 3:
									loadNoRoom_scr();
									room_goto(level27);
									global.lastCheckpoint = noone;
								break;
								case 4:
									loadNoRoom_scr();
									room_goto(level28);
									global.lastCheckpoint = noone;
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
	options = 4;
}

if (pushDelay < 0) {
	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1))
	{
		if (menu == 0) {
			switch (cursorPos)
			{
				case 0:
					loadNoRoom_scr();
					room_goto(level_Casino);
					global.lastCheckpoint = noone;
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
					loadNoRoom_scr();
					room_goto(level1);
					global.lastCheckpoint = noone;
				break;
				case 1:
					loadNoRoom_scr();
					room_goto(level2);
					global.lastCheckpoint = noone;
				break;
				case 2:
					loadNoRoom_scr();
					room_goto(level3);
					global.lastCheckpoint = noone;
				break;
			}
		} else if (menu == 2) {
			switch (cursorPos)
			{
				case 0:
					loadNoRoom_scr();
					room_goto(level4);
					global.lastCheckpoint = noone;
				break;
				case 1:
					loadNoRoom_scr();
					room_goto(level5A);
					global.lastCheckpoint = noone;
				break;
				case 2:
					loadNoRoom_scr();
					room_goto(level5B);
					global.lastCheckpoint = noone;
				break;
				case 3:
					loadNoRoom_scr();
					room_goto(level6);
					global.lastCheckpoint = noone;
				break;
				case 4:
					loadNoRoom_scr();
					room_goto(level7);
					global.lastCheckpoint = noone;
				break;
				case 5:
					loadNoRoom_scr();
					room_goto(level8);
					global.lastCheckpoint = noone;
				break;
				case 6:
					loadNoRoom_scr();
					room_goto(level9);
					global.lastCheckpoint = noone;
				break;
			}
		} else if (menu == 3) {
			switch (cursorPos)
			{
				case 0:
					loadNoRoom_scr();
					room_goto(level10);
					global.lastCheckpoint = noone;
				break;
				case 1:
					loadNoRoom_scr();
					room_goto(level11);
					global.lastCheckpoint = noone;
				break;
				case 2:
					loadNoRoom_scr();
					room_goto(level12);
					global.lastCheckpoint = noone;
				break;
				case 3:
					loadNoRoom_scr();
					room_goto(level13);
					global.lastCheckpoint = noone;
				break;
				case 4:
					loadNoRoom_scr();
					room_goto(level14);
					global.lastCheckpoint = noone;
				break;
			}
		} else if (menu == 4) {
			switch (cursorPos)
			{
				case 0:
					loadNoRoom_scr();
					room_goto(warpzone1);
					global.lastCheckpoint = noone;
				break;
				case 1:
					loadNoRoom_scr();
					room_goto(warpzone2);
					global.lastCheckpoint = noone;
				break;
				case 2:
					loadNoRoom_scr();
					room_goto(warpzone3);
					global.lastCheckpoint = noone;
				break;
			}
		} else if (menu == 5) {
			switch (cursorPos)
			{
				case 0:
					loadNoRoom_scr();
					room_goto(weaponRemove);
					global.lastCheckpoint = noone;
				break;
				case 1:
					loadNoRoom_scr();
					room_goto(level16);
					global.lastCheckpoint = noone;
				break;
				case 2:
					loadNoRoom_scr();
					room_goto(level17);
					global.lastCheckpoint = noone;
				break;
				case 3:
					loadNoRoom_scr();
					room_goto(level18);
					global.lastCheckpoint = noone;
				break;
				case 4:
					loadNoRoom_scr();
					room_goto(level19);
					global.lastCheckpoint = noone;
				break;
			}
		} else if (menu == 6) {
			switch (cursorPos)
			{
				case 0:
					loadNoRoom_scr();
					room_goto(level20);
					global.lastCheckpoint = noone;
				break;
				case 1:
					loadNoRoom_scr();
					room_goto(level21);
					global.lastCheckpoint = noone;
				break;
				case 2:
					loadNoRoom_scr();
					room_goto(level22);
					global.lastCheckpoint = noone;
				break;
				case 3:
					loadNoRoom_scr();
					room_goto(level23);
					global.lastCheckpoint = noone;
				break;
				case 4:
					loadNoRoom_scr();
					room_goto(level24);
					global.lastCheckpoint = noone;
				break;
			}
		} else if (menu == 7) {
			switch (cursorPos)
			{
				case 0:
					loadNoRoom_scr();
					room_goto(level_ConsumedCasino);
					global.lastCheckpoint = noone;
				break;
				case 1:
					loadNoRoom_scr();
					room_goto(level25);
					global.lastCheckpoint = noone;
				break;
				case 2:
					loadNoRoom_scr();
					room_goto(level26);
					global.lastCheckpoint = noone;
				break;
				case 3:
					loadNoRoom_scr();
					room_goto(level27);
					global.lastCheckpoint = noone;
				break;
				case 4:
					loadNoRoom_scr();
					room_goto(level28);
					global.lastCheckpoint = noone;
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
