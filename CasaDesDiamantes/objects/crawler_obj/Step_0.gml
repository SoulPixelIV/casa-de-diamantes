/// @description Enemy AI

x += horspeed * global.dt;
y += verspeed * global.dt;

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;