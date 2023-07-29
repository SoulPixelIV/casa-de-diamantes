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
	scene1Timer -= global.dt;
	
	if (scene1Timer < 0) {
		if (!startScene1BlackTimer) {
			camera_obj.blackscreenStrength += global.dt / 40;
		}
		
		if (camera_obj.blackscreenStrength > 0.98) {
			startScene1BlackTimer = true;
			global.cutsceneCasinoIntroDone = true;
			camera_obj.drawBlackborders = false;
			if (instance_exists(cindy_obj)) {
				instance_destroy(cindy_obj);
			}
		}
		
		if (startScene1BlackTimer) {
			scene1BlackTimer -= global.dt;
			if (scene1BlackTimer < 0) {
				camera_obj.blackscreenStrength -= global.dt / 40;
				
				if (camera_obj.blackscreenStrength < 0.05) {
					player_obj.movement = true;
					scene1Timer = scene1TimerSave;
					startScene1Timer = false;
					scene1BlackTimer = scene1BlackTimerSave;
					startScene1BlackTimer = false;
					inCutscene = false;
				}
			}
		}
	}
}
//Scene 2
if (scene2)
{
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