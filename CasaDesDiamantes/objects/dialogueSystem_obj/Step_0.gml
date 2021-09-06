//Scene 1
if (scene1)
{
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