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
	options = 5;
}
if (menu == 3) {
	options = 2;
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
			}
		}
	}
}

pushDelay -= global.dt;
