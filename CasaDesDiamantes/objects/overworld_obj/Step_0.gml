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
	options = 5;
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
	options = 1;
}

if (pushDelay < 0) {
	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1))
	{
		if (menu == 0) {
			switch (cursorPos)
			{
				case 0:
					room_goto(level0);
					global.lastCheckpoint = noone;
				break;
				case 1:
					room_goto(level_Casino);
					global.lastCheckpoint = noone;
				break;
				case 2:
					pushDelay = 70;
					menu = 4;
					cursorPos = 0;
				break;
				case 3:
					pushDelay = 70;
					menu = 1;
					cursorPos = 0;
				break;
				case 4:
					pushDelay = 70;
					menu = 2;
					cursorPos = 0;
				break;
				case 5:
					pushDelay = 70;
					menu = 3;
					cursorPos = 0;
				break;
			}
		} else if (menu == 1) {
			switch (cursorPos)
			{
				case 0:
					room_goto(level1);
					global.lastCheckpoint = noone;
				break;
				case 1:
					room_goto(level2);
					global.lastCheckpoint = noone;
				break;
				case 2:
					room_goto(level3);
					global.lastCheckpoint = noone;
				break;
			}
		} else if (menu == 2) {
			switch (cursorPos)
			{
				case 0:
					room_goto(level4);
					global.lastCheckpoint = noone;
				break;
				case 1:
					room_goto(level5A);
					global.lastCheckpoint = noone;
				break;
				case 2:
					room_goto(level5B);
					global.lastCheckpoint = noone;
				break;
				case 3:
					room_goto(level6);
					global.lastCheckpoint = noone;
				break;
				case 4:
					room_goto(level7);
					global.lastCheckpoint = noone;
				break;
				case 5:
					room_goto(level8);
					global.lastCheckpoint = noone;
				break;
				case 6:
					room_goto(level9);
					global.lastCheckpoint = noone;
				break;
			}
		} else if (menu == 3) {
			switch (cursorPos)
			{
				case 0:
					room_goto(level10);
					global.lastCheckpoint = noone;
				break;
				case 1:
					room_goto(level11);
					global.lastCheckpoint = noone;
				break;
				case 2:
					room_goto(level12);
					global.lastCheckpoint = noone;
				break;
				case 3:
					room_goto(level13);
					global.lastCheckpoint = noone;
				break;
				case 4:
					room_goto(level14);
					global.lastCheckpoint = noone;
				break;
			}
		} else if (menu == 4) {
			switch (cursorPos)
			{
				case 0:
					room_goto(warpzone1);
					global.lastCheckpoint = noone;
				break;
				case 1:
					room_goto(warpzone2);
					global.lastCheckpoint = noone;
				break;
			}
		}
	}
}

pushDelay -= global.dt;
