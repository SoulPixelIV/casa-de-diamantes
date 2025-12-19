pushDelay = pushDelaySave;

if (!global.drawWarningMenu && !global.drawStartMenu && !global.drawSkipMenu) {
	if (index == 0) {
		global.currentSaveFile = 0;
					
		if (file_exists("save1")) {
			ini_open("save1");
	
			var rm_name = ini_read_string("save1", "room", "level0");
	
			// erzwinge string
			rm_name = string(rm_name);
	
			// Jetzt den Raum holen
			var rm_index = asset_get_index(rm_name);
	
			// wenn ungültig → fallback
			if (rm_index < 0 || !room_exists(rm_index)) {
				global.drawWarningMenu = true;
			} else {
				if (file_exists("save1")) {
					load_scr();
				} else {
					global.drawWarningMenu = true;
				}
			}
								
			ini_close();
		} else {
			global.transitionScreenDest = level0;
			global.unlockedWeapon[1] = false;
			global.unlockedWeapon[2] = false;
			global.unlockedWeapon[3] = false;
			global.unlockedWeapon[4] = false;
			global.pistolAmmo = 0;
			global.shotgunAmmo = 0;
			global.sniperAmmo = 0;
			global.bowAmmo = 0;
			global.silencedMPAmmo = 0;
			global.cutsceneLevel2Done = false;
			global.reachedCasino = false;					
			global.spawn = 0;
			global.money = 0;
			global.deaths = 0;
			global.skin = 0;
			global.syringes = 0;
			global.room = noone;
			global.diamonds = 0;
			global.lastCheckpoint = noone;
			global.hasWarpzoneKey = false;
			global.keyRed = false;
			global.keyBlue = false;
			global.keyYellow = false;
			global.scorepoints = 0;
			global.currentWorld = 0;
			global.storyAct = 0;
			global.multiplier = 1;
			global.multiplierTimer = 700;
			global.multiplierTimerSave = global.multiplierTimer;
			global.timer = 0;
			global.drawTutorialInfectionUsed = false;
			global.level5AArena1Done = false;
			global.level5AArena2Done = false;
			global.level5BArena3Done = false;
			global.level4DoorOpen = false;
			global.playtime = 0;

			global.shotgunUpgrade1 = false;
			global.shotgunUpgrade2 = false;

			global.dualBarettasUpgrade1 = false;
			global.dualBarettasUpgrade2 = false;
										
			global.silencedMPUpgrade1 = false;
			global.silencedMPUpgrade2 = false;

			global.sniperUpgrade1 = false;
			global.sniperUpgrade2 = false;

			global.cupyUpgrade1 = false;
			global.cupyUpgrade2 = false;

			global.boughtSkin1 = false;

			global.reachedCasino = false;
			global.act2Unlocked = false;
			global.act3Unlocked = false;

			global.cutsceneLevel2Done = false;
			global.cutsceneCasinoIntroDone = false;

			global.arrowLevel2Done = false;
			global.arrowVIPDone = false;
			global.arrowCindyDone = false;

			global.pwlevel2UnlockedElevator = false;
			global.pwlevel3UnlockedElevator = false;

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

			global.warpzone1DoorOpen = false;
			global.warpzone1Reward = false;
			global.warpzone1RewardGiven = false;

			global.drawMission = false;
			global.introDialogueCindyDone = false;
			global.introDialogueVIPDone = false;
			global.introDialogueOutOfRoomDone = false;
			global.cupyDialogue1Done = false;
			global.cupyDialogue2Done = false;
			global.cupyDialogue3Done = false;
			global.cupyDialogue4Done = false;
			global.cupyDialogue5Done = false;
			global.cupyDialogue6Done = false;
			global.moveToWorld = 0;
										
			room_goto(transitionScreen);
		}
	}

	if (index == 1) {
		global.currentSaveFile = 1;
					
		if (file_exists("save2")) {
			ini_open("save2");
	
			var rm_name = ini_read_string("save2", "room", "level0");
	
			// erzwinge string
			rm_name = string(rm_name);
	
			// Jetzt den Raum holen
			var rm_index = asset_get_index(rm_name);
	
			// wenn ungültig → fallback
			if (rm_index < 0 || !room_exists(rm_index)) {
				global.drawWarningMenu = true;
			} else {
				if (file_exists("save2")) {
					load_scr();
				} else {
					global.drawWarningMenu = true;
				}
			}
								
			ini_close();
		} else {
			global.transitionScreenDest = level0;
			global.unlockedWeapon[1] = false;
			global.unlockedWeapon[2] = false;
			global.unlockedWeapon[3] = false;
			global.unlockedWeapon[4] = false;
			global.pistolAmmo = 0;
			global.shotgunAmmo = 0;
			global.sniperAmmo = 0;
			global.bowAmmo = 0;
			global.silencedMPAmmo = 0;
			global.cutsceneLevel2Done = false;
			global.reachedCasino = false;					
			global.spawn = 0;
			global.money = 0;
			global.deaths = 0;
			global.skin = 0;
			global.syringes = 0;
			global.room = noone;
			global.diamonds = 0;
			global.lastCheckpoint = noone;
			global.hasWarpzoneKey = false;
			global.keyRed = false;
			global.keyBlue = false;
			global.keyYellow = false;
			global.scorepoints = 0;
			global.currentWorld = 0;
			global.storyAct = 0;
			global.multiplier = 1;
			global.multiplierTimer = 700;
			global.multiplierTimerSave = global.multiplierTimer;
			global.timer = 0;
			global.drawTutorialInfectionUsed = false;
			global.level5AArena1Done = false;
			global.level5AArena2Done = false;
			global.level5BArena3Done = false;
			global.level4DoorOpen = false;
			global.playtime = 0;

			global.shotgunUpgrade1 = false;
			global.shotgunUpgrade2 = false;

			global.dualBarettasUpgrade1 = false;
			global.dualBarettasUpgrade2 = false;
										
			global.silencedMPUpgrade1 = false;
			global.silencedMPUpgrade2 = false;

			global.sniperUpgrade1 = false;
			global.sniperUpgrade2 = false;

			global.cupyUpgrade1 = false;
			global.cupyUpgrade2 = false;

			global.boughtSkin1 = false;

			global.reachedCasino = false;
			global.act2Unlocked = false;
			global.act3Unlocked = false;

			global.cutsceneLevel2Done = false;
			global.cutsceneCasinoIntroDone = false;

			global.arrowLevel2Done = false;
			global.arrowVIPDone = false;
			global.arrowCindyDone = false;

			global.pwlevel2UnlockedElevator = false;
			global.pwlevel3UnlockedElevator = false;

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

			global.warpzone1DoorOpen = false;
			global.warpzone1Reward = false;
			global.warpzone1RewardGiven = false;

			global.drawMission = false;
			global.introDialogueCindyDone = false;
			global.introDialogueVIPDone = false;
			global.introDialogueOutOfRoomDone = false;
			global.cupyDialogue1Done = false;
			global.cupyDialogue2Done = false;
			global.cupyDialogue3Done = false;
			global.cupyDialogue4Done = false;
			global.cupyDialogue5Done = false;
			global.cupyDialogue6Done = false;
			global.moveToWorld = 0;
										
			room_goto(transitionScreen);
		}
	}

	if (index == 2) {
		global.currentSaveFile = 2;
					
		if (file_exists("save3")) {
			ini_open("save3");
	
			var rm_name = ini_read_string("save3", "room", "level0");
	
			// erzwinge string
			rm_name = string(rm_name);
	
			// Jetzt den Raum holen
			var rm_index = asset_get_index(rm_name);
	
			// wenn ungültig → fallback
			if (rm_index < 0 || !room_exists(rm_index)) {
				global.drawWarningMenu = true;
			} else {
				if (file_exists("save3")) {
					load_scr();
				} else {
					global.drawWarningMenu = true;
				}
			}
								
			ini_close();
		} else {
			global.transitionScreenDest = level0;
			global.unlockedWeapon[1] = false;
			global.unlockedWeapon[2] = false;
			global.unlockedWeapon[3] = false;
			global.unlockedWeapon[4] = false;
			global.pistolAmmo = 0;
			global.shotgunAmmo = 0;
			global.sniperAmmo = 0;
			global.bowAmmo = 0;
			global.silencedMPAmmo = 0;
			global.cutsceneLevel2Done = false;
			global.reachedCasino = false;					
			global.spawn = 0;
			global.money = 0;
			global.deaths = 0;
			global.skin = 0;
			global.syringes = 0;
			global.room = noone;
			global.diamonds = 0;
			global.lastCheckpoint = noone;
			global.hasWarpzoneKey = false;
			global.keyRed = false;
			global.keyBlue = false;
			global.keyYellow = false;
			global.scorepoints = 0;
			global.currentWorld = 0;
			global.storyAct = 0;
			global.multiplier = 1;
			global.multiplierTimer = 700;
			global.multiplierTimerSave = global.multiplierTimer;
			global.timer = 0;
			global.drawTutorialInfectionUsed = false;
			global.level5AArena1Done = false;
			global.level5AArena2Done = false;
			global.level5BArena3Done = false;
			global.level4DoorOpen = false;
			global.playtime = 0;

			global.shotgunUpgrade1 = false;
			global.shotgunUpgrade2 = false;

			global.dualBarettasUpgrade1 = false;
			global.dualBarettasUpgrade2 = false;
										
			global.silencedMPUpgrade1 = false;
			global.silencedMPUpgrade2 = false;

			global.sniperUpgrade1 = false;
			global.sniperUpgrade2 = false;

			global.cupyUpgrade1 = false;
			global.cupyUpgrade2 = false;

			global.boughtSkin1 = false;

			global.reachedCasino = false;
			global.act2Unlocked = false;
			global.act3Unlocked = false;

			global.cutsceneLevel2Done = false;
			global.cutsceneCasinoIntroDone = false;

			global.arrowLevel2Done = false;
			global.arrowVIPDone = false;
			global.arrowCindyDone = false;

			global.pwlevel2UnlockedElevator = false;
			global.pwlevel3UnlockedElevator = false;

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

			global.warpzone1DoorOpen = false;
			global.warpzone1Reward = false;
			global.warpzone1RewardGiven = false;

			global.drawMission = false;
			global.introDialogueCindyDone = false;
			global.introDialogueVIPDone = false;
			global.introDialogueOutOfRoomDone = false;
			global.cupyDialogue1Done = false;
			global.cupyDialogue2Done = false;
			global.cupyDialogue3Done = false;
			global.cupyDialogue4Done = false;
			global.cupyDialogue5Done = false;
			global.cupyDialogue6Done = false;
			global.moveToWorld = 0;
										
			room_goto(transitionScreen);
		}
	}
}