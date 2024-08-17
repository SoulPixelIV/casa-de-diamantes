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
if (scene2)
{
	inCutscene = true;
	startScene2Timer = true;
	camera_obj.drawDialogueBorder = true;
	if (!camera_obj.drawText)
	{
		for (i = scene2Low; i < scene2High + 1; i++)
		{
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
	scene4Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene4Timer < 0) {
		scene4Timer = scene4TimerSave;
		startScene4Timer = false;
		global.introDialogueCindyDone = true;
		cindy2_obj.dialogueTriggered = false;
		player_obj.movement = true;
		inCutscene = false;
		camera_obj.follow = player_obj;
		camera_obj.drawBlackborders = false;
		camera_obj.drawDialogueBorder = false;
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
	scene5Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene5Timer < 0) {
		scene5Timer = scene5TimerSave;
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
	}
}

//Scene 6
if (scene6)
{
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
	scene6Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene6Timer < 0) {
		scene6Timer = scene6TimerSave;
		startScene6Timer = false;
		camera_obj.follow = player_obj;
		cindy2_obj.introDialogueDone = true;
		cindy2_obj.dialogueTriggered = false;
		camera_obj.drawDialogueBorder = false;
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
	scene7Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene7Timer < 0) {
		scene7Timer = scene7TimerSave;
		startScene7Timer = false;
		vip_obj.dialogueTriggered = false;
		player_obj.movement = true;
		camera_obj.drawBlackborders = false;
		inCutscene = false;
		camera_obj.follow = player_obj;
		camera_obj.drawDialogueBorder = false;
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
	scene8Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene8Timer < 0) {
		if (!startScene8BlackTimer) {
			camera_obj.blackscreenStrength += (global.dt / 40) * camera_obj.textSpeed;
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
			scene8BlackTimer -= global.dt * camera_obj.textSpeed;
			if (scene8BlackTimer < 0) {
				camera_obj.blackscreenStrength -= (global.dt / 40) * camera_obj.textSpeed;
				
				if (camera_obj.blackscreenStrength < 0.05) {
					//Start Next Dialogue
					dialogueSystem_obj.scene9 = true;
					camera_obj.drawBlackborders = true;
					
					scene8Timer = scene8TimerSave;
					startScene8Timer = false;
					scene8BlackTimer = scene8BlackTimerSave;
					startScene8BlackTimer = false;
					inCutscene = false;
					camera_obj.follow = player_obj;
					global.cutsceneCasinoIntroDone = true;
					camera_obj.drawDialogueBorder = false;
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
	scene9Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene9Timer < 0) {
		if (!startScene9BlackTimer) {
			camera_obj.blackscreenStrength += (global.dt / 40) * camera_obj.textSpeed;
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
			scene9BlackTimer -= global.dt * camera_obj.textSpeed;
			if (scene9BlackTimer < 0) {
				camera_obj.blackscreenStrength -= (global.dt / 40) * camera_obj.textSpeed;
				
				if (camera_obj.blackscreenStrength < 0.05) {
					//Start Next Dialogue
					dialogueSystem_obj.scene10 = true;
					camera_obj.drawBlackborders = true;
					
					scene9Timer = scene9TimerSave;
					startScene9Timer = false;
					scene9BlackTimer = scene9BlackTimerSave;
					startScene9BlackTimer = false;
					inCutscene = false;
					camera_obj.follow = player_obj;
					global.cutsceneCasinoIntroDone = true;
					camera_obj.drawDialogueBorder = false;
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
	scene10Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene10Timer < 0) {
		if (!startScene10BlackTimer) {
			camera_obj.blackscreenStrength += (global.dt / 40) * camera_obj.textSpeed;
		}
		
		if (camera_obj.blackscreenStrength > 0.98) {
			startScene10BlackTimer = true;
			camera_obj.drawBlackborders = false;
			
			if (instance_exists(cindy_obj)) {
				instance_destroy(cindy_obj);
			}
		}
		
		if (startScene10BlackTimer) {
			scene10BlackTimer -= global.dt * camera_obj.textSpeed;
			if (scene10BlackTimer < 0) {
				camera_obj.blackscreenStrength -= (global.dt / 40) * camera_obj.textSpeed;
				
				if (camera_obj.blackscreenStrength < 0.05) {		
					player_obj.movement = true;
					camera_obj.drawBlackborders = false;
					scene10Timer = scene10TimerSave;
					startScene10Timer = false;
					scene10BlackTimer = scene10BlackTimerSave;
					startScene10BlackTimer = false;
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
	scene11Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene11Timer < 0) {				
		//player_obj.movement = true;
		//camera_obj.drawBlackborders = false;
		scene11Timer = scene11TimerSave;
		startScene11Timer = false;
		//inCutscene = false;
		//camera_obj.follow = player_obj;
		global.introDialogueOutOfRoomDone = true;
		camera_obj.drawDialogueBorder = false;
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
					dialogueSystem_obj.inCutscene = false;
					startScene18Timer = false;
					inCutscene = false;
					camera_obj.follow = player_obj;
					global.firstmeetingDialogue = true;
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
					save_scr();
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