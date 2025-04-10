//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

teleportTimer -= global.dt;

x += global.dt / 1.7;
y -= global.dt / 12;

if (teleportTimer < 0) {
	if (global.moveToWorld == 0) {
		room_goto(level1);
	}
	if (global.moveToWorld == 1) {
		room_goto(level_Casino);
	}
	if (global.moveToWorld == 2) {
		room_goto(level4);
	}
	if (global.moveToWorld == 3) {
		room_goto(level10);
	}
	if (global.moveToWorld == 4) {
		room_goto(cutscene3);
	}
	if (global.moveToWorld == 5) {
		room_goto(weaponRemove);
	}
	if (global.moveToWorld == 6) {
		room_goto(level10);
	}
	if (global.moveToWorld == 7) {
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
		room_goto(level_CasinoRoof);
		audio_stop_sound(feastL1_msc);
		audio_stop_sound(feastL2_msc);
		global.lastCheckpoint = noone;
	}
	if (global.moveToWorld == 8) {
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
		room_goto(level_CasinoRoof);
		global.lastCheckpoint = noone;
		audio_stop_sound(feastL1_msc);
		audio_stop_sound(feastL2_msc);
	}
}