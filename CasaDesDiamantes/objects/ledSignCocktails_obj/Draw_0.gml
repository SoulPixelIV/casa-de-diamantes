/// @description Lensflare

draw_sprite(lensflareBlue_spr, 0, x, y);

/// @description Draw the animation
// Increase time
time += 1 / (room_speed * optionSeconds);
if (time > 1) time --;

// Calculate time curve
var frames = 1 / (optionFPS * optionSeconds);
var prog = ease(optionTimeCurve, time);
var t = (prog / frames - frac(prog / frames) + 1) * frames;

// Draw the animation
maskAnimationDraw(spr, mask, ramp, t);

