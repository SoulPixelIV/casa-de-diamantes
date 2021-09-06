xScreenSize = global.xScreenSize;
yScreenSize = global.yScreenSize;
zoom = 2;
xWindowSize = xScreenSize * zoom;
yWindowSize = yScreenSize * zoom;
xScreenSizeNew = x;
yScreenSizeNew = y;
snapCameraX = false;
snapCameraY = false;
minCameraXBorder = xScreenSize / 2 + 32;
maxCameraXBorder = (room_width - xScreenSize / 2) - 32;
minCameraYBorder = yScreenSize / 2 + 32;
maxCameraYBorder = (room_height - yScreenSize / 2) - 32;
cameraSpeed = 1;
cameraYBorder = 16;
deathDelayTimer = 500;
deathFadeIn = 0;
noHUD = false;
anim = 0;
anim2 = 0;
tutorialAnimTimer = 150;
tutorialAnimImage = 0;
reloadAnimTimer = 25;
reloadFailed = false;
finalDeath = false;
finalDeathScreenTimer = 350;
pauseDeathTimer = 200;
respawnSetScreenBrightness = false;
cameraTarget = false;
cameraTargetTimer = 500;
showWindowMenu = false;
windowMenuOffset = yScreenSize;
windowType = 0;
healthbarShrinking = 0;
healthbarShrinkStart = false;
healthbarDone = true;
updateFPS = 40;
currFps = fps_real;
currDeltatime = global.dt;
newWeapon = false;
newWeaponTimer = 200;

cameraSpeed = 0.1;
ycameraSpeed = 0.02;
originalCameraSpeed = cameraSpeed;
originalyCameraSpeed = ycameraSpeed;

reloadAnimTimerSave = reloadAnimTimer;
tutorialAnimTimerSave = tutorialAnimTimer;
cameraTargetTimerSave = cameraTargetTimer;
windowMenuOffsetSave = windowMenuOffset;
updateFPSSave = updateFPS;
finalDeathScreenTimerSave = finalDeathScreenTimer;
pauseDeathTimerSave = pauseDeathTimer;
newWeaponTimerSave = newWeaponTimer;
deathDelayTimerSave = deathDelayTimer;

shake = false;
shake_time = 0;
shake_magnitude = 0;
shake_fade = 0.25;
shake_id = noone;

enum cameraState {
    normal,
    zoomIn,
    zoomOut,
    zoomAFK,
	death
}
currentCameraState = cameraState.normal;

blackscreenStrength = 0;
zombiespikeEffectBorder = 342;
zombiespikeBorderTransparent = 0;
deathVignette = false;
vignetteStrengthTimer = 40;
vignetteStrengthTimerSave = vignetteStrengthTimer;
vignetteStrength = 1;
vignetteColor = 0.5;
vignetteColorClamp = clamp(vignetteColor, 0, 1);
vignetteColorDir = 0;
vignetteFlash = false;
drawInfectionText = false;
drawBlackborders = false;
blackbordersPos = 0;
hitVignette = false;
hitVignetteTimer = 50;
hitVignetteTimerSave = hitVignetteTimer;
vignetteAlpha = 0;
showWalljumpsLeft = false;
checkCullingAreaTimer = 50;
wheelRotation = 0;
wheelSpeed = 1;

zombiespikeEffectBorderSave = zombiespikeEffectBorder;
zombiespikeBorderTransparentSave = zombiespikeBorderTransparent;
checkCullingAreaTimerSave = checkCullingAreaTimer;
wheelSpeedSave = wheelSpeed;

checkCullingAreaTimer = 1;

camera = camera_create();

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(xScreenSize, yScreenSize,1,10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

follow = player_obj;

if (global.spawn == 0)
{
	if (Spawn1_obj.x > minCameraXBorder && Spawn1_obj.x < maxCameraXBorder)
	{
		x = Spawn1_obj.x;
	}
	else
	{
		if (Spawn1_obj.x <= minCameraXBorder)
		{
			x = minCameraXBorder + 1;
		}
		if (Spawn1_obj.x >= maxCameraXBorder)
		{
			x = maxCameraXBorder - 1;
		}
	}
	if (Spawn1_obj.y > minCameraYBorder && Spawn1_obj.y < maxCameraYBorder)
	{
		y = Spawn1_obj.y;
	}
	else
	{
		if (Spawn1_obj.y <= minCameraYBorder)
		{
			y = minCameraYBorder + 1;
		}
		if (Spawn1_obj.y >= maxCameraYBorder)
		{
			y = maxCameraYBorder - 1;
		}
	}
}
if (global.spawn == 1)
{
	if (Spawn2_obj.x > minCameraXBorder && Spawn2_obj.x < maxCameraXBorder)
	{
		x = Spawn2_obj.x;
	}
	else
	{
		if (Spawn2_obj.x <= minCameraXBorder)
		{
			x = minCameraXBorder + 1;
		}
		if (Spawn2_obj.x >= maxCameraXBorder)
		{
			x = maxCameraXBorder - 1;
		}
	}
	if (Spawn2_obj.y > minCameraYBorder && Spawn2_obj.y < maxCameraYBorder)
	{
		y = Spawn2_obj.y;
	}
	else
	{
		if (Spawn2_obj.y <= minCameraYBorder)
		{
			y = minCameraYBorder + 1;
		}
		if (Spawn2_obj.y >= maxCameraYBorder)
		{
			y = maxCameraYBorder - 1;
		}
	}
}
if (global.spawn == 2)
{
	if (Spawn3_obj.x > minCameraXBorder && Spawn3_obj.x < maxCameraXBorder)
	{
		x = Spawn3_obj.x;
	}
	else
	{
		if (Spawn3_obj.x <= minCameraXBorder)
		{
			x = minCameraXBorder + 1;
		}
		if (Spawn3_obj.x >= maxCameraXBorder)
		{
			x = maxCameraXBorder - 1;
		}
	}
	if (Spawn3_obj.y > minCameraYBorder && Spawn3_obj.y < maxCameraYBorder)
	{
		y = Spawn3_obj.y;
	}
	else
	{
		if (Spawn3_obj.y <= minCameraYBorder)
		{
			y = minCameraYBorder + 1;
		}
		if (Spawn3_obj.y >= maxCameraYBorder)
		{
			y = maxCameraYBorder - 1;
		}
	}
}
xTo = x;
yTo = y - 16;
ySave = y;

animationSpeed = 1;

//Infection Overlay
showInfOverlay = false;
showedInf = false;
InfOverlayTimer = 450;
InfOverlayTimerSave = InfOverlayTimer;
infOverlayLocked = false;
infOverlayX = xScreenSize;
infOverlayY = 0;

//Particles
randParticleX = random_range(-12, 48);
randParticleY = random_range(-12, 48);
randParticleX2 = random_range(-12, 48);
randParticleY2 = random_range(-12, 48);
randParticleX3 = random_range(-12, 48);
randParticleY3 = random_range(-12, 48);
randParticleX4 = random_range(-12, 48);
randParticleY4 = random_range(-12, 48);
randParticle2X = random_range(xScreenSize + 12, xScreenSize - 48);
randParticle2Y = random_range(yScreenSize + 12, yScreenSize - 48);
randParticle2X2 = random_range(xScreenSize + 12, xScreenSize - 48);
randParticle2Y2 = random_range(yScreenSize + 12, yScreenSize - 48);
randParticle2X3 = random_range(xScreenSize + 12, xScreenSize - 48);
randParticle2Y3 = random_range(yScreenSize + 12, yScreenSize - 48);
randParticle2X4 = random_range(xScreenSize + 12, xScreenSize - 48);
randParticle2Y4 = random_range(yScreenSize + 12, yScreenSize - 48);

//Score
scoreSpin = false;
scoreSpinTimer = 200;
playScoreStop = false;
spinsnd = noone;
scoreSpinTimerSave = scoreSpinTimer;

//Dialogue Drawing
drawText = false;
dialogue[0] = "";
dialogueStripped = "";
character = noone;
textDelay = 400;
letterDelay = 10;
dialogueLine = 0;
letterCount = 2;

textDelaySave = textDelay;
letterDelaySave = letterDelay;

partMovement = 0;
partDir = 0;

smoothness = 0.3;