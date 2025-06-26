//Movement
if (!open) {
	if (dir == 0)
	{
		verspeed = speedVer;
		if (movTimer < 0)
		{
			dir = 1;
			movTimer = movTimerSave;
		}
	}
	else
	{
		verspeed = -speedVer;
		if (movTimer < 0)
		{
			dir = 0;
			movTimer = movTimerSave;
		}
	}
}

if (open) {
	startDelay -= global.dt;
	
	if (startDelay < 0) {
		y -= flySpeed;
		flySpeed += global.dt / 500;
		fadeTimer -= global.dt;
	}
	
	if (fadeTimer < 0) {
		blackscreen_scr(0);
		teleportTimer -= global.dt;
		
		if (teleportTimer < 0) {
			if (global.storyAct == 0) {
				global.moveToWorld = 2;
				room_goto(blimpAnim);
			}
			if (global.storyAct == 1) {
				global.moveToWorld = 3;
				room_goto(blimpAnim);
			}
			if (global.storyAct == 2) {
				global.moveToWorld = 4;
				room_goto(blimpAnim);
			}
		}
	}
}

movTimer -= global.dt;

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

y += verspeed * global.dt;