/// @description Changing Values

/*
//STEAM
steam_update();

//Rich Presence
if (steam_initialised()) {
	if (room == mainmenu || room == settings || room == cutscene0 || room == cutscene1 || room == transitionScreen || room == transitionScreen2 || room == level0) {
		//steam_clear_rich_presence();
		steam_set_rich_presence("steam_display", "#StatusMainMenu");
	} else if (room == level1 || room == level2 || room == level3) {
		steam_set_rich_presence("steam_display", "#StatusParedia");
	} else if (room == level_Casino || room == level_CasinoRoof) {
		steam_set_rich_presence("steam_display", "#StatusCasino");
	} else if (room == blackjackTable) {
		steam_set_rich_presence("steam_display", "#StatusBlackjack");
	} else if (room == level4 || room == level5A || room == level5B || room == level6 || room == level7 || room == level8) {
		steam_set_rich_presence("steam_display", "#StatusSenzelaForest");
	}
}*/

//Audio Pitch
audio_sound_pitch(pistolShot_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(dualBarettasShot_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(shotgunShot_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(shotgunShellDrop1_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(shotgunShellDrop2_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(pistolShellDrop1_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(pistolShellDrop2_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(shotgunPump_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(sniperShot_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(sniperShotLoad_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(bulletHit_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(bulletHitGround_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(bucketHit_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(bulletHitHeadshot_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(bucketBroken_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(chaingunLocked_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(deathCross_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(explosion_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(coin1_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(coin2_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(coin3_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(coinslot_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(slotmachineLevel1_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(slotmachineLevel2_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(slotmachineLevel3_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(slotmachineSpinning_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(coinbarSpin_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(coinbarStop_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(jetpack_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(pickup_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(pickupSingle_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(chaingunLocked_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(drill_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(explosion_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(explosionTiny_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(lever_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(tick_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(beep_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(flamethrower_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(arrowImpact_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(arrowShotWind_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(bowReadying_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(flyingInsectShot_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(caveAmbience1_amb, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(caveAmbience2_amb, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(caveAmbience3_amb, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(caveAmbience4_amb, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(slowmoStart_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(slowmoEnd_snd, clamp(1 * global.timeScale, 0.5, 1.5));

audio_sound_pitch(infectedVoice_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(plagueInfectionVoice_snd, clamp(1 * global.timeScale, 0.5, 1.5));

audio_sound_pitch(walk1_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(glitter_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(climb1_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(climb2_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(climb3_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(climb4_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(glitterLong_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(walk2_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(jump_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(land_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(slide_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(moan1_snd, clamp(1, 0.5, 1.5));
audio_sound_pitch(moan2_snd, clamp(1, 0.5, 1.5));

audio_sound_pitch(dashslide_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(dashroll_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(dashmoan_snd, clamp(1, 0.5, 1.5));
audio_sound_pitch(jumpspin_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(doublejumpmoan_snd, clamp(1, 0.5, 1.5));
audio_sound_pitch(landmoan_snd, clamp(1, 0.5, 1.5));
audio_sound_pitch(jumpmoan_snd, clamp(1, 0.5, 1.5));


//Audio Volume
audio_sound_gain(pistolShot_snd, (global.soundVolume / 100) * currVolPistolShot, 0);
audio_sound_gain(dualBarettasShot_snd, (global.soundVolume / 100) * currVolBarettasShot, 0);
audio_sound_gain(shotgunShot_snd, (global.soundVolume / 100) * currVolShotgunShot, 0);
audio_sound_gain(shotgunShellDrop1_snd, (global.soundVolume / 100) * currVolShotgunShellDrop1, 0);
audio_sound_gain(shotgunShellDrop2_snd, (global.soundVolume / 100) * currVolShotgunShellDrop2, 0);
audio_sound_gain(pistolShellDrop1_snd, (global.soundVolume / 100) * currVolPistolShellDrop1, 0);
audio_sound_gain(pistolShellDrop2_snd, (global.soundVolume / 100) * currVolPistolShellDrop2, 0);
audio_sound_gain(shotgunPump_snd, (global.soundVolume / 100) * currVolShotgunPump, 0);
audio_sound_gain(sniperShot_snd, (global.soundVolume / 100) * currVolSniperShot, 0);
audio_sound_gain(sniperShotLoad_snd, (global.soundVolume / 100) * currVolSniperShotLoad, 0);
audio_sound_gain(bulletHit_snd, (global.soundVolume / 100) * currVolBulletHit, 0);
audio_sound_gain(bulletHitGround_snd, (global.soundVolume / 100) * currVolBulletHitGround, 0);
audio_sound_gain(bucketHit_snd, (global.soundVolume / 100) * currVolBucketHit, 0);
audio_sound_gain(bulletHitHeadshot_snd, (global.soundVolume / 100) * currVolBulletHitHeadshot, 0);
audio_sound_gain(bucketBroken_snd, (global.soundVolume / 100) * currVolBucketBroken, 0);
audio_sound_gain(chaingunLocked_snd, (global.soundVolume / 100) * currVolChaingunLocked, 0);
audio_sound_gain(deathCross_snd, (global.soundVolume / 100) * currVolDeathCross, 0);
audio_sound_gain(explosion_snd, (global.soundVolume / 100) * currVolExplosion, 0);
audio_sound_gain(coin1_snd, (global.soundVolume / 100) * currVolCoin1, 0);
audio_sound_gain(coin2_snd, (global.soundVolume / 100) * currVolCoin2, 0);
audio_sound_gain(coin3_snd, (global.soundVolume / 100) * currVolCoin3, 0);
audio_sound_gain(coinbarSpin_snd, (global.soundVolume / 100) * currVolCoinbarSpin, 0);
audio_sound_gain(coinbarStop_snd, (global.soundVolume / 100) * currVolCoinbarStop, 0);
audio_sound_gain(jetpack_snd, (global.soundVolume / 100) * currVolJetpack, 0);
audio_sound_gain(pickup_snd, (global.soundVolume / 100) * currVolPickup, 0);
audio_sound_gain(pickupSingle_snd, (global.soundVolume / 100) * currVolPickupSingle, 0);
audio_sound_gain(chaingunLocked_snd, (global.soundVolume / 100) * currVolChaingunLocked, 0);
audio_sound_gain(drill_snd, (global.soundVolume / 100) * currVolDrill, 0);
audio_sound_gain(explosion_snd, (global.soundVolume / 100) * currVolExplosion, 0);
audio_sound_gain(explosionTiny_snd, (global.soundVolume / 100) * currVolExplosionTiny, 0);
audio_sound_gain(lever_snd, (global.soundVolume / 100) * currVolLever, 0);
audio_sound_gain(tick_snd, (global.soundVolume / 100) * currVolTick, 0);
audio_sound_gain(beep_snd, (global.soundVolume / 100) * currVolBeep, 0);
audio_sound_gain(flamethrower_snd, (global.soundVolume / 100) * currVolFlamethrower, 0);
audio_sound_gain(arrowImpact_snd, (global.soundVolume / 100) * currVolArrowImpact, 0);
audio_sound_gain(arrowShotWind_snd, (global.soundVolume / 100) * currVolArrowShotWind, 0);
audio_sound_gain(bowReadying_snd, (global.soundVolume / 100) * currVolBowReadying, 0);
audio_sound_gain(flyingInsectShot_snd, (global.soundVolume / 100) * currVolFlyingInsectShot, 0);
audio_sound_gain(coinslot_snd, (global.soundVolume / 100) * currVolCoinslot, 0);
audio_sound_gain(slotmachineLevel1_snd, (global.soundVolume / 100) * currVolSlotmachineLevel1, 0);
audio_sound_gain(slotmachineLevel2_snd, (global.soundVolume / 100) * currVolSlotmachineLevel2, 0);
audio_sound_gain(slotmachineLevel3_snd, (global.soundVolume / 100) * currVolSlotmachineLevel3, 0);
audio_sound_gain(slotmachineSpinning_snd, (global.soundVolume / 100) * currVolSlotmachineSpinning, 0);
audio_sound_gain(caveAmbience1_amb, (global.soundVolume / 100) * currVolCaveAmbience1, 0);
audio_sound_gain(caveAmbience2_amb, (global.soundVolume / 100) * currVolCaveAmbience2, 0);
audio_sound_gain(caveAmbience3_amb, (global.soundVolume / 100) * currVolCaveAmbience3, 0);
audio_sound_gain(caveAmbience4_amb, (global.soundVolume / 100) * currVolCaveAmbience4, 0);
audio_sound_gain(slowmoStart_snd, (global.soundVolume / 100) * currVolSlowmoStart, 0);
audio_sound_gain(slowmoEnd_snd, (global.soundVolume / 100) * currVolSlowmoEnd, 0);

audio_sound_gain(infectedVoice_snd, (global.soundVolume / 100) * currVolInfectedVoice, 0);
audio_sound_gain(plagueInfectionVoice_snd, (global.soundVolume / 100) * currVolInfectionVoice, 0);

audio_sound_gain(walk1_snd, (global.soundVolume / 100) * currVolWalk1, 0);
audio_sound_gain(glitter_snd, (global.soundVolume / 100) * currVolGlitter, 0);
audio_sound_gain(climb1_snd, (global.soundVolume / 100) * currVolClimb1, 0);
audio_sound_gain(climb2_snd, (global.soundVolume / 100) * currVolClimb2, 0);
audio_sound_gain(climb3_snd, (global.soundVolume / 100) * currVolClimb3, 0);
audio_sound_gain(climb4_snd, (global.soundVolume / 100) * currVolClimb4, 0);
audio_sound_gain(glitterLong_snd, (global.soundVolume / 100) * currVolGlitterLong, 0);
audio_sound_gain(walk2_snd, (global.soundVolume / 100) * currVolWalk2, 0);
audio_sound_gain(jump_snd, (global.soundVolume / 100) * currVolJump, 0);
audio_sound_gain(land_snd, (global.soundVolume / 100) * currVolLand, 0);
audio_sound_gain(slide_snd, (global.soundVolume / 100) * currVolSlide, 0);
audio_sound_gain(moan1_snd, (global.soundVolume / 100) * currVolMoan1, 0);
audio_sound_gain(moan2_snd, (global.soundVolume / 100) * currVolMoan2, 0);

audio_sound_gain(dashslide_snd, (global.soundVolume / 100) * currVolDashSlide, 0);
audio_sound_gain(dashroll_snd, (global.soundVolume / 100) * currVolDashRoll, 0);
audio_sound_gain(dashmoan_snd, (global.soundVolume / 100) * currVolDashMoan, 0);
audio_sound_gain(jumpspin_snd, (global.soundVolume / 100) * currVolJumpSpin, 0);
audio_sound_gain(doublejumpmoan_snd, (global.soundVolume / 100) * currVolDoubleJumpMoan, 0);
audio_sound_gain(landmoan_snd, (global.soundVolume / 100) * currVolLandMoan, 0);
audio_sound_gain(jumpmoan_snd, (global.soundVolume / 100) * currVolJumpMoan, 0);


//Timer
if (room == level0 || room == level1 || room == level2 || room == level3)
{
	//global.timer += global.dt;
}

//Multiplier
if (global.multiplier > 1)
{
	global.multiplierTimer -= global.dt;
}
if (global.multiplierTimer < 0)
{
	global.multiplier = 1;
	global.multiplierTimer = global.multiplierTimerSave;
}

//Button Delay
global.pushDelay -= global.dt;

