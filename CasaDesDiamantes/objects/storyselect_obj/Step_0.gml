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
	options = 2;
}

if (pushDelay < 0) {
	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1))
	{
		if (menu == 0) {
			switch (cursorPos)
			{
				case 0:
					global.storyAct = 0;
					global.cutsceneCasinoIntroDone = false;
					global.introDialogueVIPDone = false;
					global.introDialogueCindyDone = false;
					global.introDialogueOutOfRoomDone = false;
					global.cupyUpgrade1 = false;
					global.cupyUpgrade2 = false;
					global.cupyDialogue1Done = false;
					global.cupyDialogue2Done = false;
					global.cupyDialogue3Done = false;
					global.cupyDialogue4Done = false;
					global.cupyDialogue5Done = false;
					
					room_goto(level_Casino);
					global.lastCheckpoint = noone;
				break;
				case 1:
					global.storyAct = 1;
					
					global.cutsceneCasinoIntroDone = true;
					global.introDialogueVIPDone = true;
					global.introDialogueCindyDone = true;
					global.introDialogueOutOfRoomDone = true;
					global.dinnerDialogue = false;
					global.cupyDialogue1Done = true;
					global.cupyDialogue2Done = true;
					global.cupyDialogue3Done = true;
					global.cupyDialogue4Done = true;
					global.cupyDialogue5Done = true;
					global.act2Unlocked = false;
					global.drawMission = false;
					
					room_goto(level_CasinoRoof);
					global.lastCheckpoint = noone;
				break;
				case 2:
					global.storyAct = 2;
					room_goto(level_Casino);
					global.lastCheckpoint = noone;
				break;
			}
		}
	}
}

pushDelay -= global.dt;
