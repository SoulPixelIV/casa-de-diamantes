xScreenSize = 480;
yScreenSize = 270;
image_speed = 0.02;
zoom = 2;
xWindowSize = xScreenSize * zoom;
yWindowSize = yScreenSize * zoom;

drawStartMenu = false;
startMenuElement = 1;

buttonBuffer = 120;
buttonBufferStart = false;
buttonBufferSave = buttonBuffer;

titleAlpha = 0;

optionsY = [200, 216, 232, 248];

cursorPos = 0;

steam_set_rich_presence("steam_display", "Main Menu");