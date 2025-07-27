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
	options = 4;
}

if (pushDelay < 0) {
	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1))
	{
		if (menu == 0) {
			switch (cursorPos)
			{
				case 0:
					global.storyAct = 0;
					global.drawMission = false;
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
					global.act2Unlocked = false;
					
					global.level6GateAOpen = false;
					global.level6GateBOpen = false;
					global.level2Gate = false;
					global.level5ABooster = false;
					global.level5AGate = false;
					global.level5BGate = false;
					global.level5BGate2 = false;
					global.level8Booster = false;
					global.level8Booster2 = false;
					global.level8Booster3 = false;
					global.level12Gate = false;
					global.level13Booster = false;
					global.level15Spring = false;
					global.level15Shortcut = false;
					global.level16Shortcut = false;
	
					global.level16FloorGate = false;
					global.level16ArenaGate = false;
					global.level16BacktrackGate1 = false;
					global.level16BacktrackGate2 = false;
					global.level18SecretGate1 = false;
					global.level18SecretGate2 = false;
					global.level19Shortcut1 = false;
					global.level21WeaponGate = false;
					global.level21MainGate = false;
					global.level21ExitGate = false;
					global.level22Stage1Gate = false;
					global.level22Stage2Gate = false;
					global.level22Stage3Gate = false;
					
					global.hasWarpzoneKey = false;
					global.keyBlue = false;
					global.keyRed = false;
					global.keyYellow = false;
					
					room_goto(level_Casino);
					global.lastCheckpoint = noone;
				break;
				case 1:
					global.storyAct = 1;
					
					global.cutsceneCasinoIntroDone = true;
					global.introDialogueVIPDone = true;
					global.introDialogueCindyDone = true;
					global.introDialogueOutOfRoomDone = true;
					global.firstmeetingDialogue = false;
					global.dinnerDialogue = false;
					global.komoBasementDialogue = false;
					global.cupyDialogue1Done = true;
					global.cupyDialogue2Done = true;
					global.cupyDialogue3Done = true;
					global.cupyDialogue4Done = true;
					global.cupyDialogue5Done = true;
					global.act2Unlocked = false;
					global.drawMission = true;
					
					global.level6GateAOpen = false;
					global.level6GateBOpen = false;
					global.level2Gate = false;
					global.level5ABooster = false;
					global.level5AGate = false;
					global.level5BGate = false;
					global.level5BGate2 = false;
					global.level8Booster = false;
					global.level8Booster2 = false;
					global.level8Booster3 = false;
					global.level12Gate = false;
					global.level13Booster = false;
					global.level15Spring = false;
					global.level15Shortcut = false;
					global.level16Shortcut = false;
	
					global.level16FloorGate = false;
					global.level16ArenaGate = false;
					global.level16BacktrackGate1 = false;
					global.level16BacktrackGate2 = false;
					global.level18SecretGate1 = false;
					global.level18SecretGate2 = false;
					global.level19Shortcut1 = false;
					global.level21WeaponGate = false;
					global.level21MainGate = false;
					global.level21ExitGate = false;
					global.level22Stage1Gate = false;
					global.level22Stage2Gate = false;
					global.level22Stage3Gate = false;
					
					global.hasWarpzoneKey = false;
					global.keyBlue = false;
					global.keyRed = false;
					global.keyYellow = false;
					
					room_goto(level_CasinoRoof);
					global.lastCheckpoint = noone;
				break;
				case 2:
					global.cutsceneCasinoIntroDone = true;
					global.introDialogueVIPDone = true;
					global.introDialogueCindyDone = true;
					global.introDialogueOutOfRoomDone = true;
					global.cupyDialogue1Done = true;
					global.cupyDialogue2Done = true;
					global.cupyDialogue3Done = true;
					global.cupyDialogue4Done = true;
					global.cupyDialogue5Done = true;
					global.komoGamblingDialogueDone = false;
					global.tristramCindyQuestioningDialogueDone = false;
					global.drawMission = false;
					global.storyAct = 2;
					
					global.level6GateAOpen = false;
					global.level6GateBOpen = false;
					global.level2Gate = false;
					global.level5ABooster = false;
					global.level5AGate = false;
					global.level5BGate = false;
					global.level5BGate2 = false;
					global.level8Booster = false;
					global.level8Booster2 = false;
					global.level8Booster3 = false;
					global.level12Gate = false;
					global.level13Booster = false;
					global.level15Spring = false;
					global.level15Shortcut = false;
					global.level16Shortcut = false;
	
					global.level16FloorGate = false;
					global.level16ArenaGate = false;
					global.level16BacktrackGate1 = false;
					global.level16BacktrackGate2 = false;
					global.level18SecretGate1 = false;
					global.level18SecretGate2 = false;
					global.level19Shortcut1 = false;
					global.level21WeaponGate = false;
					global.level21MainGate = false;
					global.level21ExitGate = false;
					global.level22Stage1Gate = false;
					global.level22Stage2Gate = false;
					global.level22Stage3Gate = false;
					
					global.hasWarpzoneKey = false;
					global.keyBlue = false;
					global.keyRed = false;
					global.keyYellow = false;
					
					room_goto(level_CasinoRoof);
					global.lastCheckpoint = noone;
				break;
				case 3:
					global.cutsceneCasinoIntroDone = true;
					global.introDialogueVIPDone = true;
					global.introDialogueCindyDone = true;
					global.introDialogueOutOfRoomDone = true;
					global.cupyDialogue1Done = true;
					global.cupyDialogue2Done = true;
					global.cupyDialogue3Done = true;
					global.cupyDialogue4Done = true;
					global.cupyDialogue5Done = true;
					global.komoGamblingDialogueDone = true;
					global.tristramCindyQuestioningDialogueDone = true;
					global.drawMission = false;
					global.storyAct = 3;
					
					global.level6GateAOpen = false;
					global.level6GateBOpen = false;
					global.level2Gate = false;
					global.level5ABooster = false;
					global.level5AGate = false;
					global.level5BGate = false;
					global.level5BGate2 = false;
					global.level8Booster = false;
					global.level8Booster2 = false;
					global.level8Booster3 = false;
					global.level12Gate = false;
					global.level13Booster = false;
					global.level15Spring = false;
					global.level15Shortcut = false;
					global.level16Shortcut = false;
	
					global.level16FloorGate = false;
					global.level16ArenaGate = false;
					global.level16BacktrackGate1 = false;
					global.level16BacktrackGate2 = false;
					global.level18SecretGate1 = false;
					global.level18SecretGate2 = false;
					global.level19Shortcut1 = false;
					global.level21WeaponGate = false;
					global.level21MainGate = false;
					global.level21ExitGate = false;
					global.level22Stage1Gate = false;
					global.level22Stage2Gate = false;
					global.level22Stage3Gate = false;
					
					global.hasWarpzoneKey = false;
					global.keyBlue = false;
					global.keyRed = false;
					global.keyYellow = false;
					
					room_goto(level_CasinoRoof);
					global.lastCheckpoint = noone;
				break;
				case 4:
					global.cutsceneCasinoIntroDone = true;
					global.introDialogueVIPDone = true;
					global.introDialogueCindyDone = true;
					global.introDialogueOutOfRoomDone = true;
					global.cupyDialogue1Done = true;
					global.cupyDialogue2Done = true;
					global.cupyDialogue3Done = true;
					global.cupyDialogue4Done = true;
					global.cupyDialogue5Done = true;
					global.komoGamblingDialogueDone = true;
					global.tristramCindyQuestioningDialogueDone = true;
					global.drawMission = false;
					global.storyAct = 4;
					
					global.level6GateAOpen = false;
					global.level6GateBOpen = false;
					global.level2Gate = false;
					global.level5ABooster = false;
					global.level5AGate = false;
					global.level5BGate = false;
					global.level5BGate2 = false;
					global.level8Booster = false;
					global.level8Booster2 = false;
					global.level8Booster3 = false;
					global.level12Gate = false;
					global.level13Booster = false;
					global.level15Spring = false;
					global.level15Shortcut = false;
					global.level16Shortcut = false;
	
					global.level16FloorGate = false;
					global.level16ArenaGate = false;
					global.level16BacktrackGate1 = false;
					global.level16BacktrackGate2 = false;
					global.level18SecretGate1 = false;
					global.level18SecretGate2 = false;
					global.level19Shortcut1 = false;
					global.level21WeaponGate = false;
					global.level21MainGate = false;
					global.level21ExitGate = false;
					global.level22Stage1Gate = false;
					global.level22Stage2Gate = false;
					global.level22Stage3Gate = false;
					
					global.hasWarpzoneKey = false;
					global.keyBlue = false;
					global.keyRed = false;
					global.keyYellow = false;
					
					room_goto(level_ConsumedCasino);
					global.lastCheckpoint = noone;
				break;
			}
		}
	}
}

pushDelay -= global.dt;
