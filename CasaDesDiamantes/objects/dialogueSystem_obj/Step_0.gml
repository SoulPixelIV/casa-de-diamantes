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
			camera_obj.blackscreenStrength += global.dt / 40;
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
				camera_obj.blackscreenStrength -= global.dt / 40;
				
				if (camera_obj.blackscreenStrength < 0.05) {
					player_obj.movement = true;
					scene1Timer = scene1TimerSave;
					startScene1Timer = false;
					scene1BlackTimer = scene1BlackTimerSave;
					startScene1BlackTimer = false;
					inCutscene = false;
					global.cutsceneCasinoIntroDone = true;
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
		cindy2_obj.introDialogueDone = true;
		cindy2_obj.dialogueTriggered = false;
		player_obj.movement = true;
		inCutscene = false;
		camera_obj.drawBlackborders = false;
	}
}

//Scene 5
if (scene5)
{
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