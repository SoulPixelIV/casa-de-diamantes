timer = 5000;
startDelay = 200;
pressDelay = 70;
name = 0;
imAlpha = 0;
flickerTimer = 65;
flickerDelay = 6;

zoom = 2;
xScreenSize = 480;
yScreenSize = 270;

xWindowSize = xScreenSize * zoom;
yWindowSize = yScreenSize * zoom;

flickerTimerSave = flickerTimer;
flickerDelaySave = flickerDelay;

window_set_fullscreen(false);
window_set_size(xScreenSize*3, yScreenSize*3);
surface_resize(application_surface, xScreenSize, yScreenSize);
display_set_gui_size(xScreenSize, yScreenSize);

window_set_fullscreen(true);