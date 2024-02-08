//Scene 1
if (scene1)
{
	inCutscene = true;
	startScene1Timer = true;
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
					global.cutsceneCasinoIntroDone = true;
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
		scene2Timer = scene1BlackTimerSave;
	}
}

//Scene 3
if (scene3)
{
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
}

//Scene 4
if (scene4)
{
	inCutscene = true;
	startScene4Timer = true;
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
		camera_obj.drawBlackborders = false;
	}
}

//Scene 5
if (scene5)
{
	inCutscene = true;
	startScene5Timer = true;
	if (!camera_obj.drawText)
	{
		for (i = scene5Low; i < scene5High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene5Low;
		camera_obj.drawText = true;
	}
	camera_obj.follow = vip_obj;
	scene5 = false;
}
if (startScene5Timer) {
	scene5Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene5Timer < 0) {
		scene5Timer = scene5TimerSave;
		startScene5Timer = false;
		vip_obj.dialogueTriggered = false;
		camera_obj.follow = player_obj;
		player_obj.movement = true;
		inCutscene = false;
		camera_obj.drawBlackborders = false;
		global.act2Unlocked = true;
		global.introDialogueVIPDone = true;
		global.drawMission = true;
	}
}

//Scene 6
if (scene6)
{
	inCutscene = true;
	startScene6Timer = true;
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
		cindy2_obj.introDialogueDone = true;
		cindy2_obj.dialogueTriggered = false;
	}
}

//Scene 7
if (scene7)
{
	inCutscene = true;
	startScene7Timer = true;
	if (!camera_obj.drawText)
	{
		for (i = scene7Low; i < scene7High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene7Low;
		camera_obj.drawText = true;
	}
	camera_obj.follow = vip_obj;
	scene7 = false;
}
if (startScene7Timer) {
	scene7Timer -= global.dt * camera_obj.textSpeed;
	
	if (scene7Timer < 0) {
		scene7Timer = scene7TimerSave;
		startScene7Timer = false;
		vip_obj.dialogueTriggered = false;
		player_obj.movement = true;
		camera_obj.follow = player_obj;
		camera_obj.drawBlackborders = false;
		inCutscene = false;
	}
}

//Scene 8
if (scene8)
{
	inCutscene = true;
	startScene8Timer = true;
	if (!camera_obj.drawText)
	{
		for (i = scene8Low; i < scene8High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene8Low;
		camera_obj.drawText = true;
	}
	if (instance_exists(camera_obj)) {
		camera_obj.follow = vip2_obj;
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
					global.cutsceneCasinoIntroDone = true;
					save_scr();
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
	if (!camera_obj.drawText)
	{
		for (i = scene9Low; i < scene9High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene9Low;
		camera_obj.drawText = true;
	}
	if (instance_exists(camera_obj)) {
		if (scene9Timer > 4000) {
			camera_obj.follow = cindy_obj;
		}
	}
	scene9 = false;
}

//Switch Camera Target
if (scene9Timer < 4000) {
	camera_obj.follow = vip2_obj;
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
					global.cutsceneCasinoIntroDone = true;
					save_scr();
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
	if (!camera_obj.drawText)
	{
		for (i = scene10Low; i < scene10High + 1; i++)
		{
			camera_obj.dialogue[i] = dialogue[i];
		}
		camera_obj.dialogueLine = scene10Low;
		camera_obj.drawText = true;
	}
	if (instance_exists(camera_obj)) {
		if (scene10Timer > 5580) {
			camera_obj.follow = cindy_obj;
		}
	}
	scene10 = false;
}

//Switch Camera Target
if (scene10Timer < 5580 && scene10Timer > 5100) {
	camera_obj.follow = player_obj;
}
if (scene10Timer < 5100 && scene10Timer > 2300) {
	camera_obj.follow = cindy_obj;
}
if (scene10Timer < 2280 && scene10Timer > 700) {
	camera_obj.follow = player_obj;
}
if (scene10Timer < 630 && scene10Timer > 0) {
	camera_obj.follow = cindy_obj;
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
			
			camera_obj.follow = player_obj;
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
					save_scr();
				}
			}
		}
	}
}