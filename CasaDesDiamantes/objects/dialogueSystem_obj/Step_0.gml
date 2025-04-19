//Scene 1
if (scene1)
{
	inCutscene = true;
	startScene1Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene1Low; i < scene1High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene1Low;
		camera_obj.drawText = true;
	}
	scene1 = false;
}
if (startScene1Timer) {
	scene1Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene1Timer < 0) {
		if (!startScene1BlackTimer) {
			camera_obj.blackscreenStrength += (global.dt / 40) * camera_obj.textSpeed;
		}
		
		if (camera_obj.blackscreenStrength > 0.98) {
			startScene1BlackTimer = true;
			camera_obj.drawBlackborders = false;
			if (instance_exists(cindy_obj)) {
				instance_destroy(cindy_obj);
			}
		}
		
		if (startScene1BlackTimer) {
			scene1BlackTimer -= global.dt * camera_obj.textSpeed;
			if (scene1BlackTimer < 0) {
				camera_obj.blackscreenStrength -= (global.dt / 40) * camera_obj.textSpeed;
				
				if (camera_obj.blackscreenStrength < 0.05) {
					player_obj.movement = true;
					scene1Timer = scene1TimerSave;
					startScene1Timer = false;
					scene1BlackTimer = scene1BlackTimerSave;
					startScene1BlackTimer = false;
					inCutscene = false;
					camera_obj.follow = player_obj;
					global.cutsceneCasinoIntroDone = true;
					camera_obj.drawDialogueBorder = false;
					save_scr();
				}
			}
		}
	}
}
//Scene 2
if (scene2) {
	inCutscene = true;
	startScene2Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText) {
		for (i = scene2Low; i < scene2High + 1; i++) {
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene2Low;
		camera_obj.drawText = true;
	}
	scene2 = false;
}
if (startScene2Timer) {
	scene2Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene2Timer < 0) {
		camera_obj.showWindowMenu = true;
		camera_obj.windowType = 1;
		camera_obj.follow = player_obj;
		scene2Timer = scene2TimerSave;
		camera_obj.drawDialogueBorder = false;
	}
}

//Scene 3
if (scene3)
{
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene3Low; i < scene3High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene3Low;
		camera_obj.drawText = true;
	}
	scene3 = false;
	camera_obj.follow = player_obj;
}

//Scene 4
if (scene4)
{
	inCutscene = true;
	startScene4Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene4Low; i < scene4High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene4Low;
		camera_obj.drawText = true;
	}
	scene4 = false;
}
if (startScene4Timer) {
	if (camera_obj.dialogueLine >= scene4High - 1) {
		scene4Timer = scene4TimerSave;
		startScene4Timer = false;
		global.introDialogueCindyDone = true;
		cindy2_obj.dialogueTriggered = false;
		player_obj.movement = true;
		inCutscene = false;
		camera_obj.follow = player_obj;
		camera_obj.drawBlackborders = false;
		camera_obj.drawDialogueBorder = false;
		camera_obj.drawText = false;
	}
}

//Scene 5
if (scene5)
{
	inCutscene = true;
	startScene5Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene5Low; i < scene5High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene5Low;
		camera_obj.drawText = true;
	}
	scene5 = false;
}
if (startScene5Timer) {
	if (camera_obj.dialogueLine >= scene5High - 1) {
		startScene5Timer = false;
		vip_obj.dialogueTriggered = false;
		player_obj.movement = true;
		inCutscene = false;
		camera_obj.follow = player_obj;
		camera_obj.drawBlackborders = false;
		global.act2Unlocked = true;
		global.introDialogueVIPDone = true;
		global.drawMission = true;
		camera_obj.drawDialogueBorder = false;
		camera_obj.drawText = false;
		save_scr();
	}
}

//Scene 6
if (scene6) {
	inCutscene = true;
	startScene6Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene6Low; i < scene6High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene6Low;
		camera_obj.drawText = true;
	}
	scene6 = false;
}
if (startScene6Timer) {
	if (camera_obj.dialogueLine >= scene6High) {
		startScene6Timer = false;
		camera_obj.follow = player_obj;
		if (instance_exists(cindy2_obj)) {
			cindy2_obj.introDialogueDone = true;
			cindy2_obj.dialogueTriggered = false;
		}
		if (instance_exists(cindy3_obj)) {
			cindy3_obj.dialogueTriggered = false;
		}
		if (instance_exists(cindy5_obj)) {
			cindy5_obj.dialogueTriggered = false;
		}
		camera_obj.drawDialogueBorder = false;
		camera_obj.drawText = false;
	}
}

//Scene 7
if (scene7)
{
	inCutscene = true;
	startScene7Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene7Low; i < scene7High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene7Low;
		camera_obj.drawText = true;
	}
	scene7 = false;
}
if (startScene7Timer) {
	scene7Timer -= global.dt;
	
	if (scene7Timer < 0) {
		scene7Timer = scene7TimerSave;
		startScene7Timer = false;
		vip_obj.dialogueTriggered = false;
		player_obj.movement = true;
		camera_obj.drawBlackborders = false;
		inCutscene = false;
		camera_obj.follow = player_obj;
		camera_obj.drawDialogueBorder = false;
		camera_obj.drawText = false;
	}
}

//Scene 8
if (scene8)
{
	inCutscene = true;
	startScene8Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene8Low; i < scene8High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene8Low;
		camera_obj.drawText = true;
	}
	scene8 = false;
}
if (startScene8Timer) {
	if (camera_obj.dialogueLine >= scene8High - 1) {
		if (!startScene8BlackTimer) {
			camera_obj.blackscreenStrength += global.dt;
		}
		
		if (camera_obj.blackscreenStrength > 0.98) {
			startScene8BlackTimer = true;
			camera_obj.drawBlackborders = false;
			//CREATE CINDY NPC
			if (!instance_exists(cindy_obj)) {
				if (instance_exists(spawnCindyNPC_obj)) {
					var cindyNPC = instance_create_layer(spawnCindyNPC_obj.x, spawnCindyNPC_obj.y, "Instances", cindy_obj);
					cindyNPC.image_xscale = -1;
				}
			}
		}
		
		if (startScene8BlackTimer) {
			scene8BlackTimer -= global.dt;
			if (scene8BlackTimer < 0) {
				camera_obj.blackscreenStrength -= global.dt;
				
				if (camera_obj.blackscreenStrength < 0.05) {
					camera_obj.drawBlackborders = false;
					camera_obj.drawText = false;
					dialogueSystem_obj.inCutscene = false;
					startScene8Timer = false;
					inCutscene = false;
					camera_obj.follow = player_obj;
					global.cutsceneCasinoIntroDone = true;
				
					//Start Next Dialogue
					dialogueSystem_obj.scene9 = true;
				}
			}
		}
	}
}

//Scene 9
if (scene9)
{
	inCutscene = true;
	startScene9Timer = true;
	camera_obj.drawDialogueBorder = true;
	camera_obj.letterCount = 0;
	if (!camera_obj.drawText)
	{
		for (i = scene9Low; i < scene9High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene9Low;
		camera_obj.drawText = true;
	}
	scene9 = false;
}

if (startScene9Timer) {
	if (camera_obj.dialogueLine >= scene9High - 1) {
		if (!startScene9BlackTimer) {
			camera_obj.blackscreenStrength += global.dt;
		}
		
		if (camera_obj.blackscreenStrength > 0.98) {
			startScene9BlackTimer = true;
			camera_obj.drawBlackborders = false;
			//REMOVE VIP NPC
			if (instance_exists(vip2_obj)) {
				instance_destroy(vip2_obj);
			}
			
			//Move Cindy NPC
			if (instance_exists(cindy_obj)) {
				var cindy = instance_nearest(x, y, cindy_obj);
				cindy.x = spawnCindyNPC2_obj.x;
				cindy.y = spawnCindyNPC2_obj.y;
			}
		}
		
		if (startScene9BlackTimer) {
			scene9BlackTimer -= global.dt;
			if (scene9BlackTimer < 0) {
				camera_obj.blackscreenStrength -= global.dt;
				
				if (camera_obj.blackscreenStrength < 0.05) {
					camera_obj.drawBlackborders = false;
					camera_obj.drawText = false;
					dialogueSystem_obj.inCutscene = false;
					startScene9Timer = false;
					inCutscene = false;
					camera_obj.follow = player_obj;
					global.cutsceneCasinoIntroDone = true;
				
					//Start Next Dialogue
					dialogueSystem_obj.scene10 = true;
				}
			}
		}
	}
}

//Scene 10
if (scene10)
{
	inCutscene = true;
	startScene10Timer = true;
	camera_obj.drawDialogueBorder = true;
	camera_obj.letterCount = 0;
	if (!camera_obj.drawText)
	{
		for (i = scene10Low; i < scene10High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene10Low;
		camera_obj.drawText = true;
	}
	scene10 = false;
}

if (startScene10Timer) {
	if (camera_obj.dialogueLine >= scene10High - 1) {
		if (!startScene10BlackTimer) {
			camera_obj.blackscreenStrength += global.dt;
		
			if (camera_obj.blackscreenStrength > 0.98) {
				startScene10BlackTimer = true;
			
				if (instance_exists(cindy_obj)) {
					instance_destroy(cindy_obj);
				}
			}
		}
		
		if (startScene10BlackTimer) {
			camera_obj.letterCount = 0;
			scene10BlackTimer -= global.dt;
			if (scene10BlackTimer < 0) {
				camera_obj.blackscreenStrength -= global.dt;
				
				if (camera_obj.blackscreenStrength < 0.05) {		
					player_obj.movement = true;
					camera_obj.drawBlackborders = false;
					camera_obj.blackscreenStrength = 0;
					camera_obj.drawText = false;
					startScene10Timer = false;
					inCutscene = false;
					camera_obj.follow = player_obj;
					camera_obj.drawDialogueBorder = false;
					save_scr();
				}
			}
		}
	}
}

//Scene 11
if (scene11)
{
	//inCutscene = true;
	startScene11Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene11Low; i < scene11High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene11Low;
		camera_obj.drawText = true;
	}
	scene11 = false;
}

if (startScene11Timer) {
	scene11Timer -= global.dt;
	
	if (scene11Timer < 0) {				
		scene11Timer = scene11TimerSave;
		startScene11Timer = false;
		global.introDialogueOutOfRoomDone = true;
		camera_obj.drawDialogueBorder = false;
		camera_obj.drawText = false;
		save_scr();
	}
}

//Scene 12
if (scene12)
{
	//inCutscene = true;
	startScene12Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene12Low; i < scene12High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene12Low;
		camera_obj.drawText = true;
	}
	scene12 = false;
}

if (startScene12Timer) {
	scene12Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene12Timer < 0) {				
		//player_obj.movement = true;
		//camera_obj.drawBlackborders = false;
		scene12Timer = scene12TimerSave;
		startScene12Timer = false;
		//inCutscene = false;
		//camera_obj.follow = player_obj;
		global.cupyDialogue1Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 13
if (scene13)
{
	//inCutscene = true;
	startScene13Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene13Low; i < scene13High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene13Low;
		camera_obj.drawText = true;
	}
	scene13 = false;
}

if (startScene13Timer) {
	scene13Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene13Timer < 0) {				
		//player_obj.movement = true;
		//camera_obj.drawBlackborders = false;
		scene13Timer = scene13TimerSave;
		startScene13Timer = false;
		//inCutscene = false;
		//camera_obj.follow = player_obj;
		global.cupyDialogue2Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 14
if (scene14)
{
	//inCutscene = true;
	startScene14Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene14Low; i < scene14High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene14Low;
		camera_obj.drawText = true;
	}
	scene14 = false;
}

if (startScene14Timer) {
	scene14Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene14Timer < 0) {				
		//player_obj.movement = true;
		//camera_obj.drawBlackborders = false;
		scene14Timer = scene14TimerSave;
		startScene14Timer = false;
		//inCutscene = false;
		//camera_obj.follow = player_obj;
		global.cupyDialogue3Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 15
if (scene15)
{
	//inCutscene = true;
	startScene15Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene15Low; i < scene15High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene15Low;
		camera_obj.drawText = true;
	}
	scene15 = false;
}

if (startScene15Timer) {
	scene15Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene15Timer < 0) {				
		//player_obj.movement = true;
		//camera_obj.drawBlackborders = false;
		scene15Timer = scene15TimerSave;
		startScene15Timer = false;
		//inCutscene = false;
		//camera_obj.follow = player_obj;
		global.cupyDialogue4Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 16
if (scene16)
{
	//inCutscene = true;
	startScene16Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene16Low; i < scene16High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene16Low;
		camera_obj.drawText = true;
	}
	scene16 = false;
}

if (startScene16Timer) {
	scene16Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene16Timer < 0) {				
		//player_obj.movement = true;
		//camera_obj.drawBlackborders = false;
		scene16Timer = scene16TimerSave;
		startScene16Timer = false;
		//inCutscene = false;
		//camera_obj.follow = player_obj;
		global.cupyDialogue5Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 17
if (scene17)
{
	//inCutscene = true;
	startScene17Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene17Low; i < scene17High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene17Low;
		camera_obj.drawText = true;
	}
	scene17 = false;
}

if (startScene17Timer) {
	scene17Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene17Timer < 0) {				
		//player_obj.movement = true;
		//camera_obj.drawBlackborders = false;
		scene17Timer = scene17TimerSave;
		startScene17Timer = false;
		//inCutscene = false;
		//camera_obj.follow = player_obj;
		global.cupyDialogue6Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 18
if (scene18) {
	inCutscene = true;
	startScene18Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene18Low; i < scene18High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene18Low;
		camera_obj.drawText = true;
	}
	scene18 = false;
}

if (startScene18Timer) {
	if (camera_obj.dialogueLine >= scene18High - 1) {
		if (!startScene18BlackTimer) {
			camera_obj.blackscreenStrength += global.dt;
		}
		
		if (camera_obj.blackscreenStrength > 0.98) {
			startScene18BlackTimer = true;
			camera_obj.drawBlackborders = false;
			
			//REMOVE NPCS
			if (instance_exists(komo_obj)) {
				instance_destroy(komo_obj);
			}
			if (instance_exists(tristram_obj)) {
				instance_destroy(tristram_obj);
			}
		}
		
		if (startScene18BlackTimer) {
			scene18BlackTimer -= global.dt;
			if (scene18BlackTimer < 0) {
				camera_obj.blackscreenStrength -= global.dt;
				
				if (camera_obj.blackscreenStrength < 0.05) {
					player_obj.movement = true;
					camera_obj.drawBlackborders = false;
					camera_obj.drawText = false;
					inCutscene = false;
					startScene18Timer = false;
					inCutscene = false;
					camera_obj.follow = player_obj;
					global.firstmeetingDialogue = true;
					global.introDialogueCindyDone = true;
					camera_obj.drawDialogueBorder = false;
					save_scr();
				}
			}
		}
	}
}

//Scene 19
if (scene19) {
	inCutscene = true;
	startScene19Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene19Low; i < scene19High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene19Low;
		camera_obj.drawText = true;
	}
	scene19 = false;
}

if (startScene19Timer) {
	if (camera_obj.dialogueLine >= scene19High - 1) {
		if (!startScene19BlackTimer) {
			camera_obj.blackscreenStrength += global.dt;
		}
		
		if (camera_obj.blackscreenStrength > 0.98) {
			startScene19BlackTimer = true;
			camera_obj.drawBlackborders = false;
			
			//REMOVE FAKE STEPH
			if (instance_exists(steph2_obj)) {
				instance_destroy(steph2_obj);
			}
		}
		
		if (startScene19BlackTimer) {
			scene19BlackTimer -= global.dt;
			if (scene19BlackTimer < 0) {
				camera_obj.blackscreenStrength -= global.dt;
				
				if (camera_obj.blackscreenStrength < 0.05) {
					player_obj.movement = true;
					camera_obj.drawBlackborders = false;
					camera_obj.drawText = false;
					dialogueSystem_obj.inCutscene = false;
					startScene19Timer = false;
					inCutscene = false;
					camera_obj.follow = player_obj;
					global.dinnerDialogue = true;
					camera_obj.drawDialogueBorder = false;
					global.money += 7500;
					camera_obj.scoreSpin = true;
					camera_obj.scoreDif = true;
					camera_obj.scoreSpinTimer = camera_obj.scoreSpinTimerSave;
					camera_obj.scoreDifTimer = camera_obj.scoreDifTimerSave;
					camera_obj.chipDif += 7500;
					audio_play_sound(buying_snd, 1, false);
					save_scr();
					room_restart();
				}
			}
		}
	}
}

//Scene 20
if (scene20) {
	inCutscene = true;
	startScene20Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene20Low; i < scene20High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene20Low;
		camera_obj.drawText = true;
	}
	scene20 = false;
}

if (startScene20Timer) {
	if (camera_obj.dialogueLine >= scene20High - 1) {
		if (!startScene20BlackTimer) {
			camera_obj.blackscreenStrength += global.dt;
		}
		
		if (camera_obj.blackscreenStrength > 0.98) {
			startScene20BlackTimer = true;
			camera_obj.drawBlackborders = false;
		}
		
		if (startScene20BlackTimer) {
			scene20BlackTimer -= global.dt;
			if (scene20BlackTimer < 0) {
				camera_obj.blackscreenStrength -= global.dt;
				
				if (camera_obj.blackscreenStrength < 0.05) {
					player_obj.movement = true;
					camera_obj.drawBlackborders = false;
					camera_obj.drawText = false;
					dialogueSystem_obj.inCutscene = false;
					startScene20Timer = false;
					inCutscene = false;
					camera_obj.follow = player_obj;
					global.komoBasementDialogue = true;
					camera_obj.drawDialogueBorder = false;
					save_scr();
				}
			}
		}
	}
}

//Scene 21
if (scene21) {
	inCutscene = true;
	startScene21Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene21Low; i < scene21High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene21Low;
		camera_obj.drawText = true;
	}
	scene21 = false;
}

if (startScene21Timer) {
	if (!phase2) {
		if (camera_obj.dialogueLine >= scene21Low + 1) {
			if (!startScene21BlackTimer) {
				camera_obj.blackscreenStrength += global.dt;
			}	
			if (camera_obj.blackscreenStrength > 0.98) {
				startScene21BlackTimer = true;
			
				if (instance_exists(tristram3_obj)) {
					tristram3_obj.sprite_index = tristram_spr;
					tristram3_obj.image_xscale = -1;
				}
			}
			if (startScene21BlackTimer) {
				scene21BlackTimer -= global.dt;
				if (scene21BlackTimer < 0) {
					camera_obj.blackscreenStrength -= global.dt;
				
					if (camera_obj.blackscreenStrength < 0.05) {
						startScene21BlackTimer = false;
						scene21BlackTimer = 600;
						phase2 = true;
					}
				}
			}
		}
	} else if (camera_obj.dialogueLine >= scene21High - 1) {
		if (!startScene21BlackTimer) {
			camera_obj.blackscreenStrength += global.dt;
		}
		
		if (camera_obj.blackscreenStrength > 0.98) {
			startScene21BlackTimer = true;
			camera_obj.drawBlackborders = false;
		}
		
		if (startScene21BlackTimer) {
			scene21BlackTimer -= global.dt;
			if (scene21BlackTimer < 0) {
				camera_obj.blackscreenStrength -= global.dt;
				
				if (camera_obj.blackscreenStrength < 0.05) {
					player_obj.movement = true;
					camera_obj.drawBlackborders = false;
					camera_obj.drawText = false;
					dialogueSystem_obj.inCutscene = false;
					startScene21Timer = false;
					inCutscene = false;
					camera_obj.follow = player_obj;
					global.tristramDialogue = true;
					camera_obj.drawDialogueBorder = false;
					save_scr();
				}
			}
		}
	}
}

//Scene 22
if (scene22) {
	inCutscene = true;
	startScene22Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene22Low; i < scene22High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene22Low;
		camera_obj.drawText = true;
	}
	scene22 = false;
}

if (startScene22Timer) {
	if (camera_obj.dialogueLine >= scene22High - 1) {
		if (!startScene22BlackTimer) {
			camera_obj.blackscreenStrength += global.dt;
		}
		
		if (camera_obj.blackscreenStrength > 0.98) {
			startScene22BlackTimer = true;
			camera_obj.drawBlackborders = false;
		}
		
		if (startScene22BlackTimer) {
			scene22BlackTimer -= global.dt;
			if (scene22BlackTimer < 0) {
				camera_obj.blackscreenStrength -= global.dt;
				
				if (camera_obj.blackscreenStrength < 0.05) {
					player_obj.movement = true;
					camera_obj.drawBlackborders = false;
					camera_obj.drawText = false;
					dialogueSystem_obj.inCutscene = false;
					startScene22Timer = false;
					inCutscene = false;
					camera_obj.follow = player_obj;
					global.tristramDialogue = true;
					camera_obj.drawDialogueBorder = false;
					save_scr();
				}
			}
		}
	}
}

//Scene 23
if (scene23) {
	inCutscene = true;
	startScene23Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene23Low; i < scene23High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene23Low;
		camera_obj.drawText = true;
	}
	scene23 = false;
}

if (startScene23Timer) {
	if (camera_obj.dialogueLine >= scene23High - 1) {
		if (!startScene23BlackTimer) {
			camera_obj.blackscreenStrength += global.dt;
		}
		
		if (camera_obj.blackscreenStrength > 0.98) {
			startScene23BlackTimer = true;
			camera_obj.drawBlackborders = false;
		}
		
		if (startScene23BlackTimer) {
			scene23BlackTimer -= global.dt;
			if (scene23BlackTimer < 0) {
				camera_obj.blackscreenStrength -= global.dt;
				
				if (camera_obj.blackscreenStrength < 0.05) {
					player_obj.movement = true;
					camera_obj.drawBlackborders = false;
					camera_obj.drawText = false;
					dialogueSystem_obj.inCutscene = false;
					startScene23Timer = false;
					inCutscene = false;
					camera_obj.follow = player_obj;
					global.meeting2Dialogue = true;
					global.act3Unlocked = true;
					camera_obj.drawDialogueBorder = false;
					save_scr();
				}
			}
		}
	}
}

//Scene 24
if (scene24)
{
	startScene24Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene24Low; i < scene24High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene24Low;
		camera_obj.drawText = true;
	}
	scene24 = false;
}

if (startScene24Timer) {
	if (camera_obj.dialogueLine >= scene24High - 1) {			
		startScene24Timer = false;
		camera_obj.drawText = false;
		global.cupyDialogue7Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 25
if (scene25)
{
	startScene25Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene25Low; i < scene25High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene25Low;
		camera_obj.drawText = true;
	}
	scene25 = false;
}

if (startScene25Timer) {
	if (camera_obj.dialogueLine >= scene25High - 1) {			
		startScene25Timer = false;
		global.cupyDialogue8Done = true;
		camera_obj.drawText = false;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 26
if (scene26)
{
	startScene26Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene26Low; i < scene26High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene26Low;
		camera_obj.drawText = true;
	}
	scene26 = false;
}

if (startScene26Timer) {
	if (camera_obj.dialogueLine >= scene26High - 1) {			
		startScene26Timer = false;
		camera_obj.drawText = false;
		global.cupyDialogue9Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 27
if (scene27)
{
	startScene27Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene27Low; i < scene27High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene27Low;
		camera_obj.drawText = true;
	}
	scene27 = false;
}

if (startScene27Timer) {
	if (camera_obj.dialogueLine >= scene27High - 1) {			
		startScene27Timer = false;
		camera_obj.drawText = false;
		global.cupyDialogue7Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 28
if (scene28) {
	inCutscene = true;
	startScene28Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene28Low; i < scene28High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene28Low;
		camera_obj.drawText = true;
	}
	scene28 = false;
}

if (startScene28Timer) {
	if (camera_obj.dialogueLine >= scene28High - 1) {
		player_obj.movement = true;
		camera_obj.drawBlackborders = false;
		camera_obj.drawText = false;
		dialogueSystem_obj.inCutscene = false;
		startScene28Timer = false;
		inCutscene = false;
		camera_obj.follow = player_obj;
		global.komoGamblingDialogueDone = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 29
if (scene29) {
	inCutscene = true;
	startScene29Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene29Low; i < scene29High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene29Low;
		camera_obj.drawText = true;
	}
	scene29 = false;
}

if (startScene29Timer) {
	if (camera_obj.dialogueLine >= scene29High - 4) {
		camera_obj.hazeEffect = true;
		audio_stop_sound(casinoTheme_msc);
	}
	if (camera_obj.dialogueLine >= scene29High - 1) {
		player_obj.movement = true;
		camera_obj.drawBlackborders = false;
		camera_obj.drawText = false;
		dialogueSystem_obj.inCutscene = false;
		startScene29Timer = false;
		inCutscene = false;
		camera_obj.follow = player_obj;
		camera_obj.hazeEffect = false;
		global.tristramCindyQuestioningDialogueDone = true;
		global.drawMission = true;
		//global.act3Unlocked = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 30
if (scene30)
{
	startScene30Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene30Low; i < scene30High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene30Low;
		camera_obj.drawText = true;
	}
	scene30 = false;
}

if (startScene30Timer) {
	if (camera_obj.dialogueLine >= scene30High - 1) {			
		startScene30Timer = false;
		camera_obj.drawText = false;
		global.cupyDialogue11Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 31
if (scene31)
{
	startScene31Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene31Low; i < scene31High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene31Low;
		camera_obj.drawText = true;
	}
	scene31 = false;
}

if (startScene31Timer) {
	if (camera_obj.dialogueLine >= scene31High - 1) {			
		startScene31Timer = false;
		camera_obj.drawText = false;
		global.cupyDialogue12Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 32
if (scene32)
{
	startScene32Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene32Low; i < scene32High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene32Low;
		camera_obj.drawText = true;
	}
	scene32 = false;
}

if (startScene32Timer) {
	if (camera_obj.dialogueLine >= scene32High - 1) {			
		startScene32Timer = false;
		camera_obj.drawText = false;
		global.cupyDialogue13Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 33
if (scene33)
{
	startScene33Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene33Low; i < scene33High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene33Low;
		camera_obj.drawText = true;
	}
	scene33 = false;
}

if (startScene33Timer) {
	if (camera_obj.dialogueLine >= scene33High - 1) {			
		startScene33Timer = false;
		camera_obj.drawText = false;
		global.cupyDialogue14Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 34
if (scene34)
{
	startScene34Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene34Low; i < scene34High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene34Low;
		camera_obj.drawText = true;
	}
	scene34 = false;
}

if (startScene34Timer) {
	if (camera_obj.dialogueLine >= scene34High - 1) {			
		startScene34Timer = false;
		camera_obj.drawText = false;
		global.cupyDialogue15Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 35
if (scene35)
{
	startScene35Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene35Low; i < scene35High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene35Low;
		camera_obj.drawText = true;
	}
	scene35 = false;
}

if (startScene35Timer) {
	if (camera_obj.dialogueLine >= scene35High - 1) {			
		startScene35Timer = false;
		camera_obj.drawText = false;
		global.cupyDialogue16Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 36
if (scene36) {
	inCutscene = true;
	startScene36Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene36Low; i < scene36High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene36Low;
		camera_obj.drawText = true;
	}
	scene36 = false;
}

if (startScene36Timer) {
	if (camera_obj.dialogueLine >= scene36High - 1) {
		player_obj.movement = true;
		camera_obj.drawBlackborders = false;
		camera_obj.drawText = false;
		dialogueSystem_obj.inCutscene = false;
		startScene36Timer = false;
		inCutscene = false;
		camera_obj.follow = player_obj;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 37
if (scene37) {
	inCutscene = true;
	startScene37Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene37Low; i < scene37High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene37Low;
		camera_obj.drawText = true;
	}
	scene37 = false;
}

if (startScene37Timer) {
	if (camera_obj.dialogueLine >= scene37High - 1) {
		player_obj.movement = true;
		camera_obj.drawBlackborders = false;
		camera_obj.drawText = false;
		dialogueSystem_obj.inCutscene = false;
		startScene37Timer = false;
		inCutscene = false;
		camera_obj.follow = player_obj;
		camera_obj.drawDialogueBorder = false;
		global.komoScaredDialogueDone = true;
		camera_obj.hazeEffect = true;
		save_scr();
	}
}

//Scene 38
if (scene38)
{
	startScene38Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene38Low; i < scene38High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene38Low;
		camera_obj.drawText = true;
	}
	scene38 = false;
}

if (startScene38Timer) {
	if (camera_obj.dialogueLine >= scene38High - 1) {			
		startScene38Timer = false;
		camera_obj.drawText = false;
		global.cupyStratoDialogue1Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 39
if (scene39)
{
	startScene39Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene39Low; i < scene39High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene39Low;
		camera_obj.drawText = true;
	}
	scene39 = false;
}

if (startScene39Timer) {
	if (camera_obj.dialogueLine >= scene39High - 1) {			
		startScene39Timer = false;
		camera_obj.drawText = false;
		global.cupyStratoDialogue2Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 40
if (scene40)
{
	startScene40Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene40Low; i < scene40High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene40Low;
		camera_obj.drawText = true;
	}
	scene40 = false;
}

if (startScene40Timer) {
	if (camera_obj.dialogueLine >= scene40High - 1) {			
		startScene40Timer = false;
		camera_obj.drawText = false;
		global.cupyStratoDialogue3Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 41
if (scene41)
{
	startScene41Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene41Low; i < scene41High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene41Low;
		camera_obj.drawText = true;
	}
	scene41 = false;
}

if (startScene41Timer) {
	if (camera_obj.dialogueLine >= scene41High - 1) {			
		startScene41Timer = false;
		camera_obj.drawText = false;
		global.cupyStratoDialogue4Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 42
if (scene42)
{
	startScene42Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene42Low; i < scene42High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene42Low;
		camera_obj.drawText = true;
	}
	scene42 = false;
}

if (startScene42Timer) {
	if (camera_obj.dialogueLine >= scene42High - 1) {			
		startScene42Timer = false;
		camera_obj.drawText = false;
		global.cupyStratoDialogue5Done = true;
		camera_obj.drawDialogueBorder = false;
		save_scr();
	}
}

//Scene 43
if (scene43) {
	inCutscene = true;
	startScene43Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene43Low; i < scene43High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene43Low;
		camera_obj.drawText = true;
	}
	scene43 = false;
}

if (startScene43Timer) {
	if (camera_obj.dialogueLine >= scene43High - 1) {
		player_obj.movement = true;
		camera_obj.drawBlackborders = false;
		camera_obj.drawText = false;
		dialogueSystem_obj.inCutscene = false;
		startScene43Timer = false;
		inCutscene = false;
		camera_obj.follow = player_obj;
		camera_obj.drawDialogueBorder = false;
		global.komoTristramConsumedDialogueDone = true;
		camera_obj.hazeEffect = true;
		save_scr();
	}
}

//Scene 44
if (scene44) {
	inCutscene = true;
	startScene44Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene44Low; i < scene44High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene44Low;
		camera_obj.drawText = true;
	}
	scene44 = false;
}
if (startScene44Timer) {
	if (camera_obj.dialogueLine >= scene44High) {
		startScene44Timer = false;
		camera_obj.follow = player_obj;
		camera_obj.drawDialogueBorder = false;
		camera_obj.drawText = false;
	}
}