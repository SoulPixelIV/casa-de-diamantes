function save_scr(){
	camera_obj.currentlySaving = true;
	
	ini_open("save1");
	
	if (room == level0 || room == level1 || room == level2 || room == level3 || room == level_Casino || room == level_CasinoRoof || room == level_Basement || room == level_BasementConsumed || room == level_ConsumedCasino || room == level_DiningHall || room == level_TristramRoom || room == level4 || room == level5A || room == level5B || room == level6 || room == level7 || room == level8 || room == level9 || room == warpzone1 || room == level10 || room == level11 || room == level12 || room == level13 || room == level14 || room == warpzone2 || room == level15 || room == level16 || room == level17 || room == level18 || room == level19 || room == warpzone3 || room == level20 || room == level21 || room == level22 || room == level23 || room == level24 || room == level25 || room == level26 || room == level27) {
		ini_write_real("save1", "room", room);
	}
	
	ini_write_real("save1", "spawn", global.spawn);
	ini_write_real("save1", "money", global.money);
	ini_write_real("save1", "diamonds", global.diamonds);
	ini_write_real("save1", "syringes", global.syringes);
	ini_write_string("save1", "lastCheckpoint", string(global.lastCheckpoint));
	ini_write_real("save1", "warpzoneKey", global.hasWarpzoneKey);
	ini_write_real("save1", "keyBlue", global.keyBlue);
	ini_write_real("save1", "keyRed", global.keyRed);
	ini_write_real("save1", "keyYellow", global.keyYellow);
	ini_write_real("save1", "currentWorld", global.currentWorld);
	ini_write_real("save1", "shownInfectionTutorial", global.drawTutorialInfectionUsed);
	ini_write_real("save1", "drunkness", global.drunknessLevel);
	
	ini_write_real("save1", "storyAct", global.storyAct);
	ini_write_real("save1", "drawMission", global.drawMission);
	
	ini_write_real("save1", "introDialogueCindyDone", global.introDialogueCindyDone);
	ini_write_real("save1", "cupyDialogue1Done", global.cupyDialogue1Done);
	ini_write_real("save1", "cupyDialogue2Done", global.cupyDialogue2Done);
	ini_write_real("save1", "cupyDialogue3Done", global.cupyDialogue3Done);
	ini_write_real("save1", "cupyDialogue4Done", global.cupyDialogue4Done);
	ini_write_real("save1", "cupyDialogue5Done", global.cupyDialogue5Done);
	
	ini_write_real("save1", "laserShot0", global.laserShot0);
	ini_write_real("save1", "laserShot1", global.laserShot1);
	ini_write_real("save1", "laserShot2", global.laserShot2);
	ini_write_real("save1", "laserShot3", global.laserShot3);
	ini_write_real("save1", "laserShot4", global.laserShot4);
	ini_write_real("save1", "laserShot5", global.laserShot5);
	
	ini_write_real("save1", "reachedCasino", global.reachedCasino);
	ini_write_real("save1", "act2Unlocked", global.act2Unlocked);
	ini_write_real("save1", "helicopterIntro", global.helicopterIntro);
	
	ini_write_real("save1", "warpzone1Done", global.warpzone1Done);
	ini_write_real("save1", "warpzone2Done", global.warpzone2Done);
	ini_write_real("save1", "warpzone3Done", global.warpzone3Done);
	
	ini_write_real("save1", "shownCutsceneLevel2", global.cutsceneLevel2Done);
	ini_write_real("save1", "shownCutsceneCasinoIntro", global.cutsceneCasinoIntroDone);
	ini_write_real("save1", "dinnerDialogue", global.dinnerDialogue);
	ini_write_real("save1", "shownVIPIntro", global.introDialogueVIPDone);
	ini_write_real("save1", "shownOutOfRoomIntro", global.introDialogueOutOfRoomDone);
	ini_write_real("save1", "firstmeetingDialogue", global.firstmeetingDialogue);
	ini_write_real("save1", "firstmeetingDialogue", global.firstmeetingDialogue);
	
	ini_write_real("save1", "komoGamblingDialogueDone", global.komoGamblingDialogueDone);
	ini_write_real("save1", "tristramCindyQuestioningDialogueDone", global.tristramCindyQuestioningDialogueDone);

	ini_write_real("save1", "pwlevel2UnlockedElevator", global.pwlevel2UnlockedElevator);
	ini_write_real("save1", "pwlevel3UnlockedElevator", global.pwlevel3UnlockedElevator);
	
	ini_write_real("save1", "pistolAmmo", global.pistolAmmo);
	ini_write_real("save1", "shotgunAmmo", global.shotgunAmmo);
	ini_write_real("save1", "bowAmmo", global.bowAmmo);
	ini_write_real("save1", "silencedMPAmmo", global.silencedMPAmmo);
	
	ini_write_real("save1", "shotgunUpgrade1", global.shotgunUpgrade1);
	ini_write_real("save1", "shotgunUpgrade2", global.shotgunUpgrade2);
	
	ini_write_real("save1", "dualBarettasUpgrade1", global.dualBarettasUpgrade1);
	ini_write_real("save1", "dualBarettasUpgrade2", global.dualBarettasUpgrade2);
	
	ini_write_real("save1", "silencedMPUpgrade1", global.silencedMPUpgrade1);
	ini_write_real("save1", "silencedMPUpgrade2", global.silencedMPUpgrade2);
	
	ini_write_real("save1", "sniperUpgrade1", global.sniperUpgrade1);
	ini_write_real("save1", "sniperUpgrade2", global.sniperUpgrade2);
	
	ini_write_real("save1", "global.cupyUpgrade1", global.cupyUpgrade1);
	ini_write_real("save1", "global.cupyUpgrade2", global.cupyUpgrade2);
	
	ini_write_real("save1", "global.boughtSkin1", global.boughtSkin1);
	ini_write_real("save1", "global.skin", global.skin);
	
	ini_write_real("save1", "level6GateAOpen", global.level6GateAOpen);
	ini_write_real("save1", "level6GateBOpen", global.level6GateBOpen);
	ini_write_real("save1", "level2Gate", global.level2Gate);
	ini_write_real("save1", "level5ABooster", global.level5ABooster);
	ini_write_real("save1", "level5AGate", global.level5AGate);
	ini_write_real("save1", "level5BGate", global.level5BGate);
	ini_write_real("save1", "level5BGate2", global.level5BGate2);
	ini_write_real("save1", "level8Booster", global.level8Booster);
	ini_write_real("save1", "level8Booster2", global.level8Booster2);
	ini_write_real("save1", "level8Booster3", global.level8Booster3);
	ini_write_real("save1", "level12Gate", global.level12Gate);
	ini_write_real("save1", "level13Booster", global.level13Booster);
	ini_write_real("save1", "level15Spring", global.level15Spring);
	ini_write_real("save1", "level15Shortcut", global.level15Shortcut);
	ini_write_real("save1", "level16Shortcut", global.level16Shortcut);

	ini_write_real("save1", "level16FloorGate", global.level16FloorGate);
	ini_write_real("save1", "level16ArenaGate", global.level16ArenaGate);
	ini_write_real("save1", "level16BacktrackGate1", global.level16BacktrackGate1);
	ini_write_real("save1", "level16BacktrackGate2", global.level16BacktrackGate2);
	ini_write_real("save1", "level18SecretGate1", global.level18SecretGate1);
	ini_write_real("save1", "level18SecretGate2", global.level18SecretGate2);
	ini_write_real("save1", "level19Shortcut1", global.level19Shortcut1);
	ini_write_real("save1", "level21WeaponGate", global.level21WeaponGate);
	ini_write_real("save1", "level21MainGate", global.level21MainGate);
	ini_write_real("save1", "level21ExitGate", global.level21ExitGate);
	ini_write_real("save1", "level22Stage1Gate", global.level22Stage1Gate);
	ini_write_real("save1", "level22Stage2Gate", global.level22Stage2Gate);
	ini_write_real("save1", "level22Stage3Gate", global.level22Stage3Gate);
	
	ini_write_real("save1", "warpzone1DoorOpen", global.warpzone1DoorOpen);
	ini_write_real("save1", "warpzone1Reward", global.warpzone1Reward);
	ini_write_real("save1", "warpzone1RewardGiven", global.warpzone1RewardGiven);
	
	ini_write_real("save1", "currentWeapon", global.currentWeapon);
	
	ini_write_real("save1", "arrowLevel2", global.arrowLevel2Done);
	ini_write_real("save1", "arrowVIP", global.arrowVIPDone);
	ini_write_real("save1", "arrowCindy", global.arrowCindyDone);
	
	ini_write_real("save1", "unlockedWeapon0", global.unlockedWeapon[0]);
	ini_write_real("save1", "unlockedWeapon1", global.unlockedWeapon[1]);
	ini_write_real("save1", "unlockedWeapon2", global.unlockedWeapon[2]);
	ini_write_real("save1", "unlockedWeapon3", global.unlockedWeapon[3]);
	ini_write_real("save1", "unlockedWeapon4", global.unlockedWeapon[4]);
	
	ini_write_real("save1", "drawMission", global.drawMission);
	
	ini_close();
}