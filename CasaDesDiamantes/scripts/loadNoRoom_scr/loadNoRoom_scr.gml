function loadNoRoom_scr() {
	
	if (global.currentSaveFile == 0) {
		ini_open("save1");

		global.spawn = ini_read_real("save1", "spawn", 0);
		global.money = ini_read_real("save1", "money", 0);
		global.diamonds = ini_read_real("save1", "diamonds", 0);
		global.syringes = ini_read_real("save1", "syringes", 0);
		global.lastCheckpoint = ini_write_string("save1", "lastCheckpoint", string(noone));
		global.hasWarpzoneKey = ini_read_real("save1", "warpzoneKey", false);
		global.keyBlue = ini_read_real("save1", "keyBlue", false);
		global.keyRed = ini_read_real("save1", "keyRed", false);
		global.keyYellow = ini_read_real("save1", "keyYellow", false);
		global.currentWorld = ini_read_real("save1", "currentWorld", 0);
		global.drawTutorialInfectionUsed = ini_read_real("save1", "shownInfectionTutorial", false);
		global.drawTutorialWeaponScrollUsed = ini_read_real("save1", "shownWeaponScrollTutorial", false);
		global.drawTutorialAmmoRecycle = ini_read_real("save1", "drawTutorialAmmoRecycle", false);
		global.drunknessLevel = ini_read_real("save1", "drunkness", 0);
		global.deaths = ini_read_real("save1", "deaths", 0);
		global.playtime = ini_read_real("save1", "playtime", 0);
		global.succDashes = ini_read_real("save1", "succDashes", 0);
	
		global.storyAct = ini_read_real("save1", "storyAct", 0);
		global.drawMission = ini_read_real("save1", "drawMission", false);

		global.introDialogueCindyDone = ini_read_real("save1", "introDialogueCindyDone", false);
		global.cupyDialogue1Done = ini_read_real("save1", "cupyDialogue1Done", false);
		global.cupyDialogue2Done = ini_read_real("save1", "cupyDialogue2Done", false);
		global.cupyDialogue3Done = ini_read_real("save1", "cupyDialogue3Done", false);
		global.cupyDialogue4Done = ini_read_real("save1", "cupyDialogue4Done", false);
		global.cupyDialogue5Done = ini_read_real("save1", "cupyDialogue5Done", false);
	
		global.laserShot0 = ini_read_real("save1", "laserShot0", false);
		global.laserShot1 = ini_read_real("save1", "laserShot1", false);
		global.laserShot2 = ini_read_real("save1", "laserShot2", false);
		global.laserShot3 = ini_read_real("save1", "laserShot3", false);
		global.laserShot4 = ini_read_real("save1", "laserShot4", false);
		global.laserShot5 = ini_read_real("save1", "laserShot5", false);
	
		global.reachedCasino = ini_read_real("save1", "reachedCasino", false);
		global.act2Unlocked = ini_read_real("save1", "act2Unlocked", false);
		global.helicopterIntro = ini_read_real("save1", "helicopterIntro", false);
	
		global.warpzone1Done = ini_read_real("save1", "warpzone1Done", false);
		global.warpzone2Done = ini_read_real("save1", "warpzone2Done", false);
		global.warpzone3Done = ini_read_real("save1", "warpzone3Done", false);
	
		global.cutsceneLevel2Done = ini_read_real("save1", "shownCutsceneLevel2", false);
		global.cutsceneCasinoIntroDone = ini_read_real("save1", "shownCutsceneCasinoIntro", false);
		global.introDialogueVIPDone = ini_read_real("save1", "shownVIPIntro", false);
		global.introDialogueOutOfRoomDone = ini_read_real("save1", "shownOutOfRoomIntro", false);
		global.dinnerDialogue = ini_read_real("save1", "dinnerDialogue", false);
		global.firstmeetingDialogue = ini_read_real("save1", "firstmeetingDialogue", false);
	
		global.komoGamblingDialogueDone = ini_read_real("save1", "komoGamblingDialogueDone", false);
		global.tristramCindyQuestioningDialogueDone = ini_read_real("save1", "tristramCindyQuestioningDialogueDone", false);

		global.pwlevel2UnlockedElevator = ini_read_real("save1", "pwlevel2UnlockedElevator", false);
		global.pwlevel3UnlockedElevator = ini_read_real("save1", "pwlevel3UnlockedElevator", false);
	
		global.pistolAmmo = ini_read_real("save1", "pistolAmmo", 0);
		global.shotgunAmmo = ini_read_real("save1", "shotgunAmmo", 0);
		global.bowAmmo = ini_read_real("save1", "bowAmmo", 0);
		global.silencedMPAmmo = ini_read_real("save1", "silencedMPAmmo", 0);
	
		global.shotgunUpgrade1 = ini_read_real("save1", "shotgunUpgrade1", false);
		global.shotgunUpgrade2 = ini_read_real("save1", "shotgunUpgrade2", false);
	
		global.dualBarettasUpgrade1 = ini_read_real("save1", "dualBarettasUpgrade1", false);
		global.dualBarettasUpgrade2 = ini_read_real("save1", "dualBarettasUpgrade2", false);
	
		global.silencedMPUpgrade1 = ini_read_real("save1", "silencedMPUpgrade1", false);
		global.silencedMPUpgrade2 = ini_read_real("save1", "silencedMPUpgrade2", false);

		global.sniperUpgrade1 = ini_read_real("save1", "sniperUpgrade1", false);
		global.sniperUpgrade2 = ini_read_real("save1", "sniperUpgrade2", false);
	
		global.cupyUpgrade1 = ini_read_real("save1", "global.cupyUpgrade1", false);
		global.cupyUpgrade2 = ini_read_real("save1", "global.cupyUpgrade2", false);
	
		global.boughtSkin1 = ini_read_real("save1", "global.boughtSkin1", false);
		global.skin = ini_read_real("save1", "global.skin", false);
	
		global.level6GateAOpen = ini_read_real("save1", "level6GateAOpen", false);
		global.level6GateBOpen = ini_read_real("save1", "level6GateBOpen", false);
		global.level2Gate = ini_read_real("save1", "level2Gate", false);
		global.level5ABooster = ini_read_real("save1", "level5ABooster", false);
		global.level5AGate = ini_read_real("save1", "level5AGate", false);
		global.level5BGate = ini_read_real("save1", "level5BGate", false);
		global.level5BGate2 = ini_read_real("save1", "level5BGate2", false);
		global.level8Booster = ini_read_real("save1", "level8Booster", false);
		global.level8Booster2 = ini_read_real("save1", "level8Booster2", false);
		global.level8Booster3 = ini_read_real("save1", "level8Booster3", false);
		global.level12Gate = ini_read_real("save1", "level12Gate", false);
		global.level13Booster = ini_read_real("save1", "level13Booster", false);
		global.level15Spring = ini_read_real("save1", "level15Spring", false);
		global.level15Shortcut = ini_read_real("save1", "level15Shortcut", false);
		global.level16Shortcut = ini_read_real("save1", "level16Shortcut", false);
	
		global.level16FloorGate = ini_read_real("save1", "level16FloorGate", false);
		global.level16ArenaGate = ini_read_real("save1", "level16ArenaGate", false);
		global.level16BacktrackGate1 = ini_read_real("save1", "level16BacktrackGate1", false);
		global.level16BacktrackGate2 = ini_read_real("save1", "level16BacktrackGate2", false);
		global.level18SecretGate1 = ini_read_real("save1", "level18SecretGate1", false);
		global.level18SecretGate2 = ini_read_real("save1", "level18SecretGate2", false);
		global.level19Shortcut1 = ini_read_real("save1", "level19Shortcut1", false);
		global.level21WeaponGate = ini_read_real("save1", "level21WeaponGate", false);
		global.level21MainGate = ini_read_real("save1", "level21MainGate", false);
		global.level21ExitGate = ini_read_real("save1", "level21ExitGate", false);
		global.level22Stage1Gate = ini_read_real("save1", "level22Stage1Gate", false);
		global.level22Stage2Gate = ini_read_real("save1", "level22Stage2Gate", false);
		global.level22Stage3Gate = ini_read_real("save1", "level22Stage3Gate", false);
	
		global.warpzone1DoorOpen = ini_read_real("save1", "warpzone1DoorOpen", false);
		global.warpzone1Reward = ini_read_real("save1", "warpzone1Reward", false);
		global.warpzone1RewardGiven = ini_read_real("save1", "warpzone1RewardGiven", false);
	
		global.currentWeapon = ini_read_real("save1", "currentWeapon", 0);
	
		global.arrowLevel2Done = ini_read_real("save1", "arrowLevel2", false);
		global.arrowVIPDone = ini_read_real("save1", "arrowVIP", false);
		global.arrowCindyDone = ini_read_real("save1", "arrowCindy", false);
	
		global.unlockedWeapon[0] = ini_read_real("save1", "unlockedWeapon0", false);
		global.unlockedWeapon[1] = ini_read_real("save1", "unlockedWeapon1", false);
		global.unlockedWeapon[2] = ini_read_real("save1", "unlockedWeapon2", false);
		global.unlockedWeapon[3] = ini_read_real("save1", "unlockedWeapon3", false);
		global.unlockedWeapon[4] = ini_read_real("save1", "unlockedWeapon4", false);
	
		global.drawMission = ini_read_real("save1", "drawMission", false);
	
		ini_close();
	}
	
	if (global.currentSaveFile == 1) {
		ini_open("save2");

		global.spawn = ini_read_real("save2", "spawn", 0);
		global.money = ini_read_real("save2", "money", 0);
		global.diamonds = ini_read_real("save2", "diamonds", 0);
		global.syringes = ini_read_real("save2", "syringes", 0);
		global.lastCheckpoint = ini_write_string("save2", "lastCheckpoint", string(noone));
		global.hasWarpzoneKey = ini_read_real("save2", "warpzoneKey", false);
		global.keyBlue = ini_read_real("save2", "keyBlue", false);
		global.keyRed = ini_read_real("save2", "keyRed", false);
		global.keyYellow = ini_read_real("save2", "keyYellow", false);
		global.currentWorld = ini_read_real("save2", "currentWorld", 0);
		global.drawTutorialInfectionUsed = ini_read_real("save2", "shownInfectionTutorial", false);
		global.drawTutorialWeaponScrollUsed = ini_read_real("save2", "shownWeaponScrollTutorial", false);
		global.drawTutorialAmmoRecycle = ini_read_real("save2", "drawTutorialAmmoRecycle", false);
		global.drunknessLevel = ini_read_real("save2", "drunkness", 0);
		global.deaths = ini_read_real("save2", "deaths", 0);
		global.playtime = ini_read_real("save2", "playtime", 0);
		global.succDashes = ini_read_real("save2", "succDashes", 0);
	
		global.storyAct = ini_read_real("save2", "storyAct", 0);
		global.drawMission = ini_read_real("save2", "drawMission", false);

		global.introDialogueCindyDone = ini_read_real("save2", "introDialogueCindyDone", false);
		global.cupyDialogue1Done = ini_read_real("save2", "cupyDialogue1Done", false);
		global.cupyDialogue2Done = ini_read_real("save2", "cupyDialogue2Done", false);
		global.cupyDialogue3Done = ini_read_real("save2", "cupyDialogue3Done", false);
		global.cupyDialogue4Done = ini_read_real("save2", "cupyDialogue4Done", false);
		global.cupyDialogue5Done = ini_read_real("save2", "cupyDialogue5Done", false);
	
		global.laserShot0 = ini_read_real("save2", "laserShot0", false);
		global.laserShot1 = ini_read_real("save2", "laserShot1", false);
		global.laserShot2 = ini_read_real("save2", "laserShot2", false);
		global.laserShot3 = ini_read_real("save2", "laserShot3", false);
		global.laserShot4 = ini_read_real("save2", "laserShot4", false);
		global.laserShot5 = ini_read_real("save2", "laserShot5", false);
	
		global.reachedCasino = ini_read_real("save2", "reachedCasino", false);
		global.act2Unlocked = ini_read_real("save2", "act2Unlocked", false);
		global.helicopterIntro = ini_read_real("save2", "helicopterIntro", false);
	
		global.warpzone1Done = ini_read_real("save2", "warpzone1Done", false);
		global.warpzone2Done = ini_read_real("save2", "warpzone2Done", false);
		global.warpzone3Done = ini_read_real("save2", "warpzone3Done", false);
	
		global.cutsceneLevel2Done = ini_read_real("save2", "shownCutsceneLevel2", false);
		global.cutsceneCasinoIntroDone = ini_read_real("save2", "shownCutsceneCasinoIntro", false);
		global.introDialogueVIPDone = ini_read_real("save2", "shownVIPIntro", false);
		global.introDialogueOutOfRoomDone = ini_read_real("save2", "shownOutOfRoomIntro", false);
		global.dinnerDialogue = ini_read_real("save2", "dinnerDialogue", false);
		global.firstmeetingDialogue = ini_read_real("save2", "firstmeetingDialogue", false);
	
		global.komoGamblingDialogueDone = ini_read_real("save2", "komoGamblingDialogueDone", false);
		global.tristramCindyQuestioningDialogueDone = ini_read_real("save2", "tristramCindyQuestioningDialogueDone", false);

		global.pwlevel2UnlockedElevator = ini_read_real("save2", "pwlevel2UnlockedElevator", false);
		global.pwlevel3UnlockedElevator = ini_read_real("save2", "pwlevel3UnlockedElevator", false);
	
		global.pistolAmmo = ini_read_real("save2", "pistolAmmo", 0);
		global.shotgunAmmo = ini_read_real("save2", "shotgunAmmo", 0);
		global.bowAmmo = ini_read_real("save2", "bowAmmo", 0);
		global.silencedMPAmmo = ini_read_real("save2", "silencedMPAmmo", 0);
	
		global.shotgunUpgrade1 = ini_read_real("save2", "shotgunUpgrade1", false);
		global.shotgunUpgrade2 = ini_read_real("save2", "shotgunUpgrade2", false);
	
		global.dualBarettasUpgrade1 = ini_read_real("save2", "dualBarettasUpgrade1", false);
		global.dualBarettasUpgrade2 = ini_read_real("save2", "dualBarettasUpgrade2", false);
	
		global.silencedMPUpgrade1 = ini_read_real("save2", "silencedMPUpgrade1", false);
		global.silencedMPUpgrade2 = ini_read_real("save2", "silencedMPUpgrade2", false);

		global.sniperUpgrade1 = ini_read_real("save2", "sniperUpgrade1", false);
		global.sniperUpgrade2 = ini_read_real("save2", "sniperUpgrade2", false);
	
		global.cupyUpgrade1 = ini_read_real("save2", "global.cupyUpgrade1", false);
		global.cupyUpgrade2 = ini_read_real("save2", "global.cupyUpgrade2", false);
	
		global.boughtSkin1 = ini_read_real("save2", "global.boughtSkin1", false);
		global.skin = ini_read_real("save2", "global.skin", false);
	
		global.level6GateAOpen = ini_read_real("save2", "level6GateAOpen", false);
		global.level6GateBOpen = ini_read_real("save2", "level6GateBOpen", false);
		global.level2Gate = ini_read_real("save2", "level2Gate", false);
		global.level5ABooster = ini_read_real("save2", "level5ABooster", false);
		global.level5AGate = ini_read_real("save2", "level5AGate", false);
		global.level5BGate = ini_read_real("save2", "level5BGate", false);
		global.level5BGate2 = ini_read_real("save2", "level5BGate2", false);
		global.level8Booster = ini_read_real("save2", "level8Booster", false);
		global.level8Booster2 = ini_read_real("save2", "level8Booster2", false);
		global.level8Booster3 = ini_read_real("save2", "level8Booster3", false);
		global.level12Gate = ini_read_real("save2", "level12Gate", false);
		global.level13Booster = ini_read_real("save2", "level13Booster", false);
		global.level15Spring = ini_read_real("save2", "level15Spring", false);
		global.level15Shortcut = ini_read_real("save2", "level15Shortcut", false);
		global.level16Shortcut = ini_read_real("save2", "level16Shortcut", false);
	
		global.level16FloorGate = ini_read_real("save2", "level16FloorGate", false);
		global.level16ArenaGate = ini_read_real("save2", "level16ArenaGate", false);
		global.level16BacktrackGate1 = ini_read_real("save2", "level16BacktrackGate1", false);
		global.level16BacktrackGate2 = ini_read_real("save2", "level16BacktrackGate2", false);
		global.level18SecretGate1 = ini_read_real("save2", "level18SecretGate1", false);
		global.level18SecretGate2 = ini_read_real("save2", "level18SecretGate2", false);
		global.level19Shortcut1 = ini_read_real("save2", "level19Shortcut1", false);
		global.level21WeaponGate = ini_read_real("save2", "level21WeaponGate", false);
		global.level21MainGate = ini_read_real("save2", "level21MainGate", false);
		global.level21ExitGate = ini_read_real("save2", "level21ExitGate", false);
		global.level22Stage1Gate = ini_read_real("save2", "level22Stage1Gate", false);
		global.level22Stage2Gate = ini_read_real("save2", "level22Stage2Gate", false);
		global.level22Stage3Gate = ini_read_real("save2", "level22Stage3Gate", false);
	
		global.warpzone1DoorOpen = ini_read_real("save2", "warpzone1DoorOpen", false);
		global.warpzone1Reward = ini_read_real("save2", "warpzone1Reward", false);
		global.warpzone1RewardGiven = ini_read_real("save2", "warpzone1RewardGiven", false);
	
		global.currentWeapon = ini_read_real("save2", "currentWeapon", 0);
	
		global.arrowLevel2Done = ini_read_real("save2", "arrowLevel2", false);
		global.arrowVIPDone = ini_read_real("save2", "arrowVIP", false);
		global.arrowCindyDone = ini_read_real("save2", "arrowCindy", false);
	
		global.unlockedWeapon[0] = ini_read_real("save2", "unlockedWeapon0", false);
		global.unlockedWeapon[1] = ini_read_real("save2", "unlockedWeapon1", false);
		global.unlockedWeapon[2] = ini_read_real("save2", "unlockedWeapon2", false);
		global.unlockedWeapon[3] = ini_read_real("save2", "unlockedWeapon3", false);
		global.unlockedWeapon[4] = ini_read_real("save2", "unlockedWeapon4", false);
	
		global.drawMission = ini_read_real("save2", "drawMission", false);
	
		ini_close();
	}
	
	if (global.currentSaveFile == 2) {
		ini_open("save3");

		global.spawn = ini_read_real("save3", "spawn", 0);
		global.money = ini_read_real("save3", "money", 0);
		global.diamonds = ini_read_real("save3", "diamonds", 0);
		global.syringes = ini_read_real("save3", "syringes", 0);
		global.lastCheckpoint = ini_write_string("save3", "lastCheckpoint", string(noone));
		global.hasWarpzoneKey = ini_read_real("save3", "warpzoneKey", false);
		global.keyBlue = ini_read_real("save3", "keyBlue", false);
		global.keyRed = ini_read_real("save3", "keyRed", false);
		global.keyYellow = ini_read_real("save3", "keyYellow", false);
		global.currentWorld = ini_read_real("save3", "currentWorld", 0);
		global.drawTutorialInfectionUsed = ini_read_real("save3", "shownInfectionTutorial", false);
		global.drawTutorialWeaponScrollUsed = ini_read_real("save3", "shownWeaponScrollTutorial", false);
		global.drawTutorialAmmoRecycle = ini_read_real("save3", "drawTutorialAmmoRecycle", false);
		global.drunknessLevel = ini_read_real("save3", "drunkness", 0);
		global.deaths = ini_read_real("save3", "deaths", 0);
		global.playtime = ini_read_real("save3", "playtime", 0);
		global.succDashes = ini_read_real("save3", "succDashes", 0);
	
		global.storyAct = ini_read_real("save3", "storyAct", 0);
		global.drawMission = ini_read_real("save3", "drawMission", false);

		global.introDialogueCindyDone = ini_read_real("save3", "introDialogueCindyDone", false);
		global.cupyDialogue1Done = ini_read_real("save3", "cupyDialogue1Done", false);
		global.cupyDialogue2Done = ini_read_real("save3", "cupyDialogue2Done", false);
		global.cupyDialogue3Done = ini_read_real("save3", "cupyDialogue3Done", false);
		global.cupyDialogue4Done = ini_read_real("save3", "cupyDialogue4Done", false);
		global.cupyDialogue5Done = ini_read_real("save3", "cupyDialogue5Done", false);
	
		global.laserShot0 = ini_read_real("save3", "laserShot0", false);
		global.laserShot1 = ini_read_real("save3", "laserShot1", false);
		global.laserShot2 = ini_read_real("save3", "laserShot2", false);
		global.laserShot3 = ini_read_real("save3", "laserShot3", false);
		global.laserShot4 = ini_read_real("save3", "laserShot4", false);
		global.laserShot5 = ini_read_real("save3", "laserShot5", false);
	
		global.reachedCasino = ini_read_real("save3", "reachedCasino", false);
		global.act2Unlocked = ini_read_real("save3", "act2Unlocked", false);
		global.helicopterIntro = ini_read_real("save3", "helicopterIntro", false);
	
		global.warpzone1Done = ini_read_real("save3", "warpzone1Done", false);
		global.warpzone2Done = ini_read_real("save3", "warpzone2Done", false);
		global.warpzone3Done = ini_read_real("save3", "warpzone3Done", false);
	
		global.cutsceneLevel2Done = ini_read_real("save3", "shownCutsceneLevel2", false);
		global.cutsceneCasinoIntroDone = ini_read_real("save3", "shownCutsceneCasinoIntro", false);
		global.introDialogueVIPDone = ini_read_real("save3", "shownVIPIntro", false);
		global.introDialogueOutOfRoomDone = ini_read_real("save3", "shownOutOfRoomIntro", false);
		global.dinnerDialogue = ini_read_real("save3", "dinnerDialogue", false);
		global.firstmeetingDialogue = ini_read_real("save3", "firstmeetingDialogue", false);
	
		global.komoGamblingDialogueDone = ini_read_real("save3", "komoGamblingDialogueDone", false);
		global.tristramCindyQuestioningDialogueDone = ini_read_real("save3", "tristramCindyQuestioningDialogueDone", false);

		global.pwlevel2UnlockedElevator = ini_read_real("save3", "pwlevel2UnlockedElevator", false);
		global.pwlevel3UnlockedElevator = ini_read_real("save3", "pwlevel3UnlockedElevator", false);
	
		global.pistolAmmo = ini_read_real("save3", "pistolAmmo", 0);
		global.shotgunAmmo = ini_read_real("save3", "shotgunAmmo", 0);
		global.bowAmmo = ini_read_real("save3", "bowAmmo", 0);
		global.silencedMPAmmo = ini_read_real("save3", "silencedMPAmmo", 0);
	
		global.shotgunUpgrade1 = ini_read_real("save3", "shotgunUpgrade1", false);
		global.shotgunUpgrade2 = ini_read_real("save3", "shotgunUpgrade2", false);
	
		global.dualBarettasUpgrade1 = ini_read_real("save3", "dualBarettasUpgrade1", false);
		global.dualBarettasUpgrade2 = ini_read_real("save3", "dualBarettasUpgrade2", false);
	
		global.silencedMPUpgrade1 = ini_read_real("save3", "silencedMPUpgrade1", false);
		global.silencedMPUpgrade2 = ini_read_real("save3", "silencedMPUpgrade2", false);

		global.sniperUpgrade1 = ini_read_real("save3", "sniperUpgrade1", false);
		global.sniperUpgrade2 = ini_read_real("save3", "sniperUpgrade2", false);
	
		global.cupyUpgrade1 = ini_read_real("save3", "global.cupyUpgrade1", false);
		global.cupyUpgrade2 = ini_read_real("save3", "global.cupyUpgrade2", false);
	
		global.boughtSkin1 = ini_read_real("save3", "global.boughtSkin1", false);
		global.skin = ini_read_real("save3", "global.skin", false);
	
		global.level6GateAOpen = ini_read_real("save3", "level6GateAOpen", false);
		global.level6GateBOpen = ini_read_real("save3", "level6GateBOpen", false);
		global.level2Gate = ini_read_real("save3", "level2Gate", false);
		global.level5ABooster = ini_read_real("save3", "level5ABooster", false);
		global.level5AGate = ini_read_real("save3", "level5AGate", false);
		global.level5BGate = ini_read_real("save3", "level5BGate", false);
		global.level5BGate2 = ini_read_real("save3", "level5BGate2", false);
		global.level8Booster = ini_read_real("save3", "level8Booster", false);
		global.level8Booster2 = ini_read_real("save3", "level8Booster2", false);
		global.level8Booster3 = ini_read_real("save3", "level8Booster3", false);
		global.level12Gate = ini_read_real("save3", "level12Gate", false);
		global.level13Booster = ini_read_real("save3", "level13Booster", false);
		global.level15Spring = ini_read_real("save3", "level15Spring", false);
		global.level15Shortcut = ini_read_real("save3", "level15Shortcut", false);
		global.level16Shortcut = ini_read_real("save3", "level16Shortcut", false);
	
		global.level16FloorGate = ini_read_real("save3", "level16FloorGate", false);
		global.level16ArenaGate = ini_read_real("save3", "level16ArenaGate", false);
		global.level16BacktrackGate1 = ini_read_real("save3", "level16BacktrackGate1", false);
		global.level16BacktrackGate2 = ini_read_real("save3", "level16BacktrackGate2", false);
		global.level18SecretGate1 = ini_read_real("save3", "level18SecretGate1", false);
		global.level18SecretGate2 = ini_read_real("save3", "level18SecretGate2", false);
		global.level19Shortcut1 = ini_read_real("save3", "level19Shortcut1", false);
		global.level21WeaponGate = ini_read_real("save3", "level21WeaponGate", false);
		global.level21MainGate = ini_read_real("save3", "level21MainGate", false);
		global.level21ExitGate = ini_read_real("save3", "level21ExitGate", false);
		global.level22Stage1Gate = ini_read_real("save3", "level22Stage1Gate", false);
		global.level22Stage2Gate = ini_read_real("save3", "level22Stage2Gate", false);
		global.level22Stage3Gate = ini_read_real("save3", "level22Stage3Gate", false);
	
		global.warpzone1DoorOpen = ini_read_real("save3", "warpzone1DoorOpen", false);
		global.warpzone1Reward = ini_read_real("save3", "warpzone1Reward", false);
		global.warpzone1RewardGiven = ini_read_real("save3", "warpzone1RewardGiven", false);
	
		global.currentWeapon = ini_read_real("save3", "currentWeapon", 0);
	
		global.arrowLevel2Done = ini_read_real("save3", "arrowLevel2", false);
		global.arrowVIPDone = ini_read_real("save3", "arrowVIP", false);
		global.arrowCindyDone = ini_read_real("save3", "arrowCindy", false);
	
		global.unlockedWeapon[0] = ini_read_real("save3", "unlockedWeapon0", false);
		global.unlockedWeapon[1] = ini_read_real("save3", "unlockedWeapon1", false);
		global.unlockedWeapon[2] = ini_read_real("save3", "unlockedWeapon2", false);
		global.unlockedWeapon[3] = ini_read_real("save3", "unlockedWeapon3", false);
		global.unlockedWeapon[4] = ini_read_real("save3", "unlockedWeapon4", false);
	
		global.drawMission = ini_read_real("save3", "drawMission", false);
	
		ini_close();
	}
}