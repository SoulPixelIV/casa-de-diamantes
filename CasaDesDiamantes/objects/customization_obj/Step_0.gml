if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
{
	if (cursorPos > 0)
	{
		cursorPos--;
	}
	else
	{
		cursorPos = array_length(optionsY) - 1;
	}
}
if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
{
	if (cursorPos < array_length(optionsY) - 1)
	{
		cursorPos++;
	}
	else
	{
		cursorPos = 0;
	}
}

if (keyboard_check_pressed(vk_right))
{
	switch (cursorPos)
	{
		case 0:
			if (currSelectionHat < array_length(global.hatlist) - 1) {
				currSelectionHat ++;
			} else {
				currSelectionHat = 0;
			}
		break;
		case 1:
			if (currSelectionTop1 < array_length(global.top1list) - 1) {
				currSelectionTop1 ++;
			} else {
				currSelectionTop1 = 0;
			}
		break;
		case 2:
			if (currSelectionTop2 < array_length(global.top2list) - 1) {
				currSelectionTop2 ++;
			} else {
				currSelectionTop2 = 0;
			}
		break;
		case 3:
			if (currSelectionBottom < array_length(global.bottomlist) - 1) {
				currSelectionBottom ++;
			} else {
				currSelectionBottom = 0;
			}
		break;
	}
}

if (keyboard_check_pressed(vk_left))
{
	switch (cursorPos)
	{
		case 0:
			if (currSelectionHat > 0) {
				currSelectionHat --;
			} else {
				currSelectionHat = array_length(global.hatlist) - 1;
			}
		break;
		case 1:
			if (currSelectionTop1 > 0) {
				currSelectionTop1 --;
			} else {
				currSelectionTop1 = array_length(global.top1list) - 1;
			}
		break;
		case 2:
			if (currSelectionTop2 > 0) {
				currSelectionTop2 --;
			} else {
				currSelectionTop2 = array_length(global.top2list) - 1;
			}
		break;
		case 3:
			if (currSelectionBottom > 0) {
				currSelectionBottom --;
			} else {
				currSelectionBottom = array_length(global.bottomlist) - 1;
			}
		break;
	}
}

if (keyboard_check_pressed(vk_enter)) {
	if (cursorPos == 4) {
		//Set Clothes
		global.hat = global.hatName[currSelectionHat];
		global.top1 = global.top1Name[currSelectionTop1];
		
		switch (currSelectionTop2)
		{
			case 0:
				global.top2 = smokingJacketEquipped_spr;
			break;
			case 1:
				global.top2 = warmJacketEquipped_spr;
			break;
			case 2:
				global.top2 = noone;
			break;
		}
		
		global.bottom = global.bottomName[currSelectionBottom];
		global.arm = global.armName[currSelectionTop2];
		room_goto_next()
	}
}
