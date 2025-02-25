xScreenSize = global.xScreenSize;
yScreenSize = global.yScreenSize;
zoom = 2;
xScreenSizeNew = x;
yScreenSizeNew = y;
snapCameraX = false;
snapCameraY = false;
cutsceneCamera = false;
minCameraXBorder = global.xScreenSize / 2 + 32;
maxCameraXBorder = (room_width - global.xScreenSize / 2) - 32;
minCameraYBorder = global.yScreenSize / 2 + 32;
maxCameraYBorder = (room_height - global.yScreenSize / 2) - 32;
cameraSpeed = 1;
cameraYBorder = 16;
currentlySaving = false;
deathDelayTimer = 500;
visualalarmlight = false;
visualalarmlightDir = 0;
showStartscreen = false;
showStartTitle1 = false;
showStartTitle2 = false;
showStartTitle3 = false;
showStartTitle4 = false;
startScreenDone = false;
startScreenXAxis1 = 0;
startScreenXAxis2 = 0;
startScreenYAxis = 0;
deathFadeIn = 0;
noHUD = false;
textSpeed = 1;
image_speed = 1;
anim = 0;
anim2 = 0;
tutorialAnimTimer = 150;
tutorialAnimImage = 0;
reloadAnimTimer = 25;
reloadFailed = false;
finalDeath = false;
finalDeathScreenTimer = 350;
pauseDeathTimer = 200;
deathInProg = false;
respawnSetScreenBrightness = false;
cameraTarget = false;
cameraTarget2 = false;
cameraTrainCutscene = false;
cameraTargetMovement = false;
cameraTargetTimer = 500;
showWindowMenu = false;
hazeEffect = false;
hazeAnim = 15;
hazeAnimDir = 0;
drawElevatorSign = false;
createdElevatorSignButtons = false;
elevatorButton1 = noone;
windowMenuOffset = global.yScreenSize;
windowType = 0;
healthbarShrinking = 0;
healthbarShrinkStart = false;
healthbarDone = true;
updateFPS = 40;
currFps = fps_real;
currDeltatime = global.dt;
newWeapon = false;
newWeaponTimer = 200;
redDoorMessage = false;
hpFullMessage = false;
blueDoorMessage = false;
yellowDoorMessage = false;
warpzoneMessage = false;
mannequinMessage1 = false;
mannequinMessage2 = false;
showInfectionHealedText = false;
infectionHealedTextTimer = 800;
overlayTextAlpha = 1;
startAlphaTransition = false;
drawTutorialInfection = false;
drawTutorialAlpha = 0;
drawTutorialInputDelay = 0;
drawPause = false;
pauseAlpha = 0;
pauseOffset = 0;
pauseScreen = 0;
pauseSpawnedHitboxes = false;
window1SpawnedHitboxes = false;
showBossHealthbar = false;
showBossHealthbar2 = false;
showWeaponProhibited = false;
weaponProhibitedTextTimer = 120;
barkeeperWindowIndex = 2;
drawDialogueBorder = false;
chipDif = 0;
minecartCamera = false;

cameraSpeed = 0.02;
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
infectionHealedTextTimerSave = infectionHealedTextTimer;
weaponProhibitedTextTimerSave = weaponProhibitedTextTimer;

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
drawDiningEntranceText = false;
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
firstMoveTimer = 5;
firstMoveDone = false;
arenaCompleteMessage = false;
arenaCompleteMessageTimer = 1250;
proximitysensorTimer = 100;
saveIconDelay = 30;

enemy[0] = noone;

zombiespikeEffectBorderSave = zombiespikeEffectBorder;
zombiespikeBorderTransparentSave = zombiespikeBorderTransparent;
checkCullingAreaTimerSave = checkCullingAreaTimer;
wheelSpeedSave = wheelSpeed;
arenaCompleteMessageTimerSave = arenaCompleteMessageTimer;
proximitysensorTimerSave = proximitysensorTimer;
saveIconDelaySave = saveIconDelay;

checkCullingAreaTimer = 1;

camera = camera_create();

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(global.xScreenSize, global.yScreenSize,1,10000);

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
infOverlayX = global.xScreenSize;
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
randParticle2X = random_range(global.xScreenSize + 12, global.xScreenSize - 48);
randParticle2Y = random_range(global.yScreenSize + 12, global.yScreenSize - 48);
randParticle2X2 = random_range(global.xScreenSize + 12, global.xScreenSize - 48);
randParticle2Y2 = random_range(global.yScreenSize + 12, global.yScreenSize - 48);
randParticle2X3 = random_range(global.xScreenSize + 12, global.xScreenSize - 48);
randParticle2Y3 = random_range(global.yScreenSize + 12, global.yScreenSize - 48);
randParticle2X4 = random_range(global.xScreenSize + 12, global.xScreenSize - 48);
randParticle2Y4 = random_range(global.yScreenSize + 12, global.yScreenSize - 48);

//Score
scoreSpin = false;
scoreDif = false;
scoreSpinTimer = 200;
scoreDifTimer = 500;
playScoreStop = false;
spinsnd = noone;
scoreSpinTimerSave = scoreSpinTimer;
scoreDifTimerSave = scoreDifTimer;

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

cursorPos = 0;
cursorAnim = 0;

smoothness = 0.3;

//Character Border Creator
if (!instance_exists(characterBorderCreator_obj)) {
	instance_create_layer(x, y, "MidgroundObjects", characterBorderCreator_obj);
}