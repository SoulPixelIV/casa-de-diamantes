function save_scr(){
	camera_obj.currentlySaving = true;
	
	ini_open("save1");
	
	if (room == level0 || room == level1 || room == level2 || room == level3 || room == level_Casino || room == level_CasinoRoof || room == level4 || room == level5A || room == level5B || room == level6 || room == level7 || room == level8 || room == level9 || room == level10) {
		ini_write_real("save1", "room", room);
	}
	
	ini_write_real("save1", "spawn", global.spawn);
	ini_write_real("save1", "money", global.money);
	ini_write_real("save1", "syringes", global.syringes);
	ini_write_string("save1", "lastCheckpoint", string(global.lastCheckpoint));
	ini_write_real("save1", "warpzoneKey", global.hasWarpzoneKey);
	ini_write_real("save1", "keyBlue", global.keyBlue);
	ini_write_real("save1", "keyRed", global.keyRed);
	ini_write_real("save1", "keyYellow", global.keyYellow);
	ini_write_real("save1", "currentWorld", global.currentWorld);
	ini_write_real("save1", "shownInfectionTutorial", global.drawTutorialInfectionUsed);
	
	ini_write_real("save1", "reachedCasino", global.reachedCasino);
	ini_write_real("save1", "act2Unlocked", global.act2Unlocked);
	
	ini_write_real("save1", "shownCutsceneLevel2", global.cutsceneLevel2Done);
	ini_write_real("save1", "shownCutsceneCasinoIntro", global.cutsceneCasinoIntroDone);
	ini_write_real("save1", "shownVIPIntro", global.introDialogueVIPDone);

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
	
	ini_write_real("save1", "global.cupyUpgrade1", global.cupyUpgrade1);
	ini_write_real("save1", "global.cupyUpgrade2", global.cupyUpgrade2);
	
	ini_write_real("save1", "level4DoorOpen", global.level4DoorOpen);
	ini_write_real("save1", "level6GateAOpen", global.level6GateAOpen);
	ini_write_real("save1", "level6GateBOpen", global.level6GateBOpen);
	
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