/// @description Variables

global.spawn = 7;
global.money = 1800;
global.syringes = 0;
global.room = noone;
global.lastCheckpoint = noone;
global.hasWarpzoneKey = false;
global.keyRed = false;
global.keyBlue = false;
global.keyYellow = false;
global.scorepoints = 0;
global.currentWorld = 0;
global.multiplier = 1;
global.multiplierTimer = 700;
global.multiplierTimerSave = global.multiplierTimer;
global.timer = 0;
global.drawTutorialInfectionUsed = false;
global.pushDelay = 60;
global.pushDelaySave = global.pushDelay;
multiplierRun = false;

global.shotgunUpgrade1 = false;
global.shotgunUpgrade2 = false;

global.dualBarettasUpgrade1 = false;

global.reachedCasino = false;
global.act2Unlocked = false;

global.cutsceneLevel2Done = false;
global.cutsceneCasinoIntroDone = false;

global.pwlevel2UnlockedElevator = false;
global.pwlevel3UnlockedElevator = false;

global.pistolAmmo = 0;
global.pistolAmmoMax = 16;
global.pistolCooldown = 3;
global.pistolCooldownSave = global.pistolCooldown;
global.pistolReload = 300;
global.pistolReloadSave = global.pistolReload;

global.dualBarettasCooldown = 4;
global.dualBarettasCooldownSave = global.dualBarettasCooldown;
global.dualBarettasReload = 500;
global.dualBarettasReloadSave = global.dualBarettasReload;

global.shotgunAmmo = 0;
global.shotgunAmmoMax = 6;
global.shotgunCooldown = 14;
global.shotgunCooldownSave = global.shotgunCooldown;
global.shotgunReload = 750;
global.shotgunReloadSave = global.shotgunReload;

global.sniperAmmo = 0;
global.sniperAmmoMax = 8;
global.sniperCooldown = 25;
global.sniperCooldownSave = global.sniperCooldown;
global.sniperReload = 600;
global.sniperReloadSave = global.sniperReload;

global.bowAmmo = 0;
global.bowAmmoMax = 8;
global.bowCooldown = 5;
global.bowCooldownSave = global.bowCooldown;
global.bowReload = 600;
global.bowReloadSave = global.bowReload;

global.silencedMPAmmo = 24;
global.silencedMPAmmoMax = 24;
global.silencedMPCooldown = 9;
global.silencedMPCooldownSave = global.silencedMPCooldown;
global.silencedMPReload = 750;
global.silencedMPReloadSave = global.silencedMPReload;

//Gates, Doors etc.
global.level4DoorOpen = false;
global.level6GateAOpen = false;
global.level6GateBOpen = false;

global.warpzone1DoorOpen = false;
global.warpzone1Reward = false;
global.warpzone1RewardGiven = false;


global.hat = choose(noone);
global.top1 = choose(noone);
global.top2 = choose(noone);
global.bottom = choose(noone);
global.shoes = noone;
global.arm = choose(noone);

global.hatlist = ["Beret", "Marcus Hat", "Nothing"];
global.top1list = ["Smoking Top", "Glitter Top", "Nothing"];
global.top2list = ["Smoking Jacket", "Warm Jacket", "Nothing"];
global.bottomlist = ["Smoking Bottom", "Glitter Bottom", "Nothing"];
global.shoeslist = ["Nothing"];
global.armlist = ["Smoking Jacket Arms", "Warm Jacket Arms", "Nothing"];

global.hatName = [beret_spr, marcusHat_spr, noone];
global.top1Name = [smokingTop_spr, glitterTop_spr, noone];
global.top2Name = [smokingJacket_spr, warmJacket_spr, noone];
global.bottomName = [smokingBottom_spr, glitterBottom_spr, noone];
global.shoesName = [noone];
global.armName = [smokingJacketArm_spr, warmJacketArm_spr, noone];

enum pickedWeapon {
	unarmed,
	pistol,
	dualBarettas,
	shotgun,
	bow,
	silencedMP
	}
	
global.currentWeapon = pickedWeapon.unarmed;

global.unlockedWeapon[0] = false;
global.unlockedWeapon[1] = false;
global.unlockedWeapon[2] = false;
global.unlockedWeapon[3] = false;
global.unlockedWeapon[4] = false;

blackjackBackToMenu = false;

currVolBulletHitGround = audio_sound_get_gain(bulletHitGround_snd);
currVolPistolShot = audio_sound_get_gain(pistolShot_snd);
currVolBarettasShot = audio_sound_get_gain(dualBarettasShot_snd);
currVolShotgunShot = audio_sound_get_gain(shotgunShot_snd);
currVolShotgunShellDrop1 = audio_sound_get_gain(shotgunShellDrop1_snd);
currVolShotgunShellDrop2 = audio_sound_get_gain(shotgunShellDrop2_snd);
currVolPistolShellDrop1 = audio_sound_get_gain(pistolShellDrop1_snd);
currVolPistolShellDrop2 = audio_sound_get_gain(pistolShellDrop2_snd);
currVolShotgunPump = audio_sound_get_gain(shotgunPump_snd);
currVolSniperShot = audio_sound_get_gain(sniperShot_snd);
currVolSniperShotLoad = audio_sound_get_gain(sniperShotLoad_snd);
currVolBulletHit = audio_sound_get_gain(bulletHit_snd);
currVolBucketHit = audio_sound_get_gain(bucketHit_snd);
currVolBulletHitHeadshot = audio_sound_get_gain(bulletHitHeadshot_snd);
currVolBucketBroken = audio_sound_get_gain(bucketBroken_snd);
currVolChaingunLocked = audio_sound_get_gain(chaingunLocked_snd);
currVolDeathCross = audio_sound_get_gain(deathCross_snd);
currVolExplosion = audio_sound_get_gain(explosion_snd);
currVolCoin1 = audio_sound_get_gain(coin1_snd);
currVolCoin2 = audio_sound_get_gain(coin2_snd);
currVolCoin3 = audio_sound_get_gain(coin3_snd);
currVolCoinbarSpin = audio_sound_get_gain(coinbarSpin_snd);
currVolCoinbarStop = audio_sound_get_gain(coinbarStop_snd);
currVolJetpack = audio_sound_get_gain(jetpack_snd);
currVolPickup = audio_sound_get_gain(pickup_snd);
currVolPickupSingle = audio_sound_get_gain(pickupSingle_snd);
currVolChaingunLocked = audio_sound_get_gain(chaingunLocked_snd);
currVolDrill = audio_sound_get_gain(drill_snd);
currVolExplosion = audio_sound_get_gain(explosion_snd);
currVolExplosionTiny = audio_sound_get_gain(explosionTiny_snd);
currVolLever = audio_sound_get_gain(lever_snd);
currVolTick = audio_sound_get_gain(tick_snd);
currVolBeep = audio_sound_get_gain(beep_snd);
currVolFlamethrower = audio_sound_get_gain(flamethrower_snd);
currVolArrowImpact = audio_sound_get_gain(arrowImpact_snd);
currVolArrowShotWind = audio_sound_get_gain(arrowShotWind_snd);
currVolBowReadying = audio_sound_get_gain(bowReadying_snd);
currVolFlyingInsectShot = audio_sound_get_gain(flyingInsectShot_snd);
currVolCoinslot = audio_sound_get_gain(coinslot_snd);
currVolSlotmachineLevel1 = audio_sound_get_gain(slotmachineLevel1_snd);
currVolSlotmachineLevel2 = audio_sound_get_gain(slotmachineLevel2_snd);
currVolSlotmachineLevel3 = audio_sound_get_gain(slotmachineLevel3_snd);
currVolSlotmachineSpinning = audio_sound_get_gain(slotmachineSpinning_snd);
currVolCaveAmbience1 = audio_sound_get_gain(caveAmbience1_amb);
currVolCaveAmbience2 = audio_sound_get_gain(caveAmbience2_amb);
currVolCaveAmbience3 = audio_sound_get_gain(caveAmbience3_amb);
currVolCaveAmbience4 = audio_sound_get_gain(caveAmbience4_amb);
currVolSlowmoStart = audio_sound_get_gain(slowmoStart_snd);
currVolSlowmoEnd = audio_sound_get_gain(slowmoEnd_snd);

currVolInfectedVoice = audio_sound_get_gain(infectedVoice_snd);
currVolInfectionVoice = audio_sound_get_gain(plagueInfectionVoice_snd);

currVolWalk1 = audio_sound_get_gain(walk1_snd);
currVolGlitter = audio_sound_get_gain(glitter_snd);
currVolClimb1 = audio_sound_get_gain(climb1_snd);
currVolClimb2 = audio_sound_get_gain(climb2_snd);
currVolClimb3 = audio_sound_get_gain(climb3_snd);
currVolClimb4 = audio_sound_get_gain(climb4_snd);
currVolGlitterLong = audio_sound_get_gain(glitterLong_snd);
currVolWalk2 = audio_sound_get_gain(walk2_snd);
currVolJump = audio_sound_get_gain(jump_snd);
currVolLand = audio_sound_get_gain(land_snd);
currVolSlide = audio_sound_get_gain(slide_snd);
currVolMoan1 = audio_sound_get_gain(moan1_snd);
currVolMoan2 = audio_sound_get_gain(moan2_snd);

currVolDashSlide = audio_sound_get_gain(dashslide_snd);
currVolDashRoll = audio_sound_get_gain(dashroll_snd);
currVolDashMoan = audio_sound_get_gain(dashmoan_snd);
currVolJumpSpin = audio_sound_get_gain(jumpspin_snd);
currVolDoubleJumpMoan = audio_sound_get_gain(doublejumpmoan_snd);
currVolLandMoan = audio_sound_get_gain(landmoan_snd);
currVolJumpMoan = audio_sound_get_gain(jumpmoan_snd);