xScreenSize = 480;
yScreenSize = 270;
image_speed = 0.02;
zoom = 2;
menu = 0;
xWindowSize = xScreenSize * zoom;
yWindowSize = yScreenSize * zoom;

optionsY = [64, 80, 96, 112, 128, 144, 160, 176, 192, 208, 224, 240, 256];
options = array_length(optionsY) - 1;

pushDelay = 70;
pushDelayStart = false;
cursorImage = 0;

cursorPos = 0;