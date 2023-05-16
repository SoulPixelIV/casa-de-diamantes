xScreenSize = 480;
yScreenSize = 270;
cursorPos = 0;
cursorAnim = 0;
pressDelay = 250;
noHUD = false;
camera = camera_create();
inputMethod = 0;
cursorImage = 0;
blackjackMenuElement = 0;

blackscreenDelay = 300;
blackscreenStrength = 1;

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(xScreenSize, yScreenSize, 1, 10000);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[0] = camera;

follow = noone;

if (instance_exists(player_obj))
{
	x = player_obj.x;
	y = player_obj.y;
}
xTo = x;
yTo = y;
ySave = y;

animationSpeed = 1;

//Score
edgeMarginVer = 8;
scoreSpin = false;
scoreSpinTimer = 200;
playScoreStop = false;
spinsnd = noone;
scoreSpinTimerSave = scoreSpinTimer;

pressDelaySave = pressDelay;