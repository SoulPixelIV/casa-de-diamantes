/// @description Draw vars
draw_text(32, 32, "Framerate: " + string(fps_real));
draw_text(32, 64, "Roomspeed: " + string(fps));
draw_text(32, 660, "AMMO: " + string(global.pistolAmmo) + " | " + string(global.pistolMag));
draw_text(32, 600, "Cooldown: " + string(global.pistolCooldown) + " | " + string(global.dualBarettasCooldown) + " | " + string(global.shotgunCooldown));
