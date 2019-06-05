/// @description Draw vars
draw_text(32, 32, "Framerate: " + string(fps_real));
draw_text(32, 64, "Roomspeed: " + string(fps));
draw_text(32, 632, "AMMO PS: " + string(global.pistolAmmo) + " | " + string(global.pistolMag));
draw_text(32, 600, "AMMO DB: " + string(global.dualBarettasAmmo) + " | " + string(global.dualBarettasMag));
draw_text(32, 668, "AMMO SG: " + string(global.shotgunAmmo) + " | " + string(global.shotgunMag));
draw_text(32, 636, "Cooldown: " + string(global.pistolCooldown) + " | " + string(global.dualBarettasCooldown) + " | " + string(global.shotgunCooldown));
