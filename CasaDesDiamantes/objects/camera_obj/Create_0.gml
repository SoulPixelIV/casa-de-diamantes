xScreenSize = 480;
yScreenSize = 270;
xWindowSize = xScreenSize * 2;
yWindowSize = yScreenSize * 2;
xScreenSizeNew = x;
yScreenSizeNew = y;
cameraSpeed = 1;
cameraYBorder = 16;
noHUD = false;
anim = 0;
anim2 = 0;
tutorialAnimTimer = 150;
tutorialAnimImage = 0;
reloadAnimTimer = 25;
reloadFailed = false;

reloadAnimTimerSave = reloadAnimTimer;
tutorialAnimTimerSave = tutorialAnimTimer;

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
hitVignette = false;
hitVignetteTimer = 50;
hitVignetteTimerSave = hitVignetteTimer;
vignetteAlpha = 0;

zombiespikeEffectBorderSave = zombiespikeEffectBorder;
zombiespikeBorderTransparentSave = zombiespikeBorderTransparent;

camera = camera_create();

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(xScreenSize, yScreenSize,1,10000);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[0] = camera;

follow = player_obj;

if (instance_exists(player_obj))
{
	x = player_obj.x;
	y = player_obj.y;
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

smoothness = 0.15;