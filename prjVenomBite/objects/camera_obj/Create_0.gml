/// @description Camera Variables

image_speed = 0.1;
viewX = 512;
viewY = 288;
viewXSave = viewX;
viewYSave = viewY;
mXPos = 0;
mYPos = 0;
xCoor = 100;
yCoor = 100;
xCoorNew = xCoor;
yCoorNew = yCoor;

pistolRecoilZoom = 32;
dualBarettasRecoilZoom = 48;
shotgunRecoilZoom = 72;
slowmotionZoomStrength = 64;
recoilZoomX = 0;
recoilZoomY = 0;
slowmotionZoomX = 0;
slowmotionZoomY = 0;
zoomCooldown = 5000;
vignetteStrength = 1;
vignetteStrengthTimer = 12;
vignetteStrengthTimerSave = vignetteStrengthTimer;
scoreShakeLength = 80;
scoreMovementSpeed = 0.2;
scoreMovementMax = 1;
rotation = 0;
dir = 0;
zombieShakeDir = 0;
zombieShakeSpeed = 4;
zombieShakeTime = 30;
scoreShake = false;
deathVignette = false;
drawInfectionText = false;
noZoom = false;
zoomAFK = false;
zoomOut = false;
zoomIn = false;
noHUD = false;

enum cameraState {
    normal,
    zoomIn,
    zoomOut,
    zoomAFK
}

currentCameraState = cameraState.normal;

zoomCooldownSave = zoomCooldown;

view_camera[0] = camera_create();
