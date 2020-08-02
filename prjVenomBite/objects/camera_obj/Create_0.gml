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
reloadAnimTimer = 25;
reloadAnimTimerSave = reloadAnimTimer;

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

image_speed = 0.1;

//Infection Overlay
showInfOverlay = false;
showedInf = false;
InfOverlayTimer = 450;
InfOverlayTimerSave = InfOverlayTimer;
infOverlayLocked = false;
infOverlayX = xScreenSize;
infOverlayY = 0;