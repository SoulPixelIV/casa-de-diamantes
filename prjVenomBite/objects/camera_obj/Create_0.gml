/// @description Camera Variables

viewX = 512;
viewY = 288;
mXPos = 0;
mYPos = 0;
xCoor = 100;
yCoor = 100;

zoomCooldown = 300;
scoreShakeLength = 80;
scoreMovementSpeed = 0.2;
scoreMovementMax = 1;
rotation = 0;
dir = 0;
zombieShakeDir = 0;
scoreShake = false;
deathVignette = false;
drawInfectionText = false;
noZoom = false;
noHUD = false;

zoomCooldownSave = zoomCooldown;

view_camera[0] = camera_create();
