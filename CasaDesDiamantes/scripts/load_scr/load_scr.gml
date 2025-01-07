function load_scr(){
	ini_open("save1");
	
	global.room = ini_read_real("save1", "room", level0);
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
	global.drunknessLevel = ini_read_real("save1", "drunkness", 0);
	
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
	
	global.cupyUpgrade1 = ini_read_real("save1", "global.cupyUpgrade1", false);
	global.cupyUpgrade2 = ini_read_real("save1", "global.cupyUpgrade2", false);
	
	global.boughtSkin1 = ini_read_real("save1", "global.boughtSkin1", false);
	global.skin = ini_read_real("save1", "global.skin", false);
	
	global.level4DoorOpen = ini_read_real("save1", "level4DoorOpen", false);
	global.level6GateAOpen = ini_read_real("save1", "level6GateAOpen", false);
	global.level6GateBOpen = ini_read_real("save1", "level6GateBOpen", false);
	global.level15Shortcut = ini_read_real("save1", "level15Shortcut", false);
	
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