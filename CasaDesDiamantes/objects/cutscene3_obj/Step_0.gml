timer -= global.dt;

if (timer < 0) {
	audio_stop_all();
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
					
	room_goto(level_CasinoRoof);
	global.lastCheckpoint = noone;
}

