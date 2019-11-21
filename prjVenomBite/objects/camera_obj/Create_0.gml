/// @description Camera Variables

viewX = 512;
viewY = 288;
viewXSave = viewX;
viewYSave = viewY;
mXPos = 0;
mYPos = 0;
xCoor = 100;
yCoor = 100;

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
zoomOut = false;
zoomIn = false;
noHUD = false;

zoomCooldownSave = zoomCooldown;

view_camera[0] = camera_create();
