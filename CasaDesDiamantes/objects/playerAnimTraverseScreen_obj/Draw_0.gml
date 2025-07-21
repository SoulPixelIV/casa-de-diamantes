/// @description Draw Guns

draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_center);

draw_set_color(c_black);
draw_text(global.xScreenSize / 2 - 1, global.yScreenSize - 14 + 1, "Travelling...");
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(global.xScreenSize / 2, global.yScreenSize - 14, "Travelling...");

shotgunArmX = x -4;
shotgunArmY = y - 10;
shotgunArmCurvedX = x + 4;
shotgunArmCurvedY = y - 8;

armSpriteShotgun = playerArmEmptyWalkingReverse_spr;
armSpriteCurvedShotgun = playerArmCurvedWalkingReverse_spr;
spriteShotgun = playerShotgunWalkingReverse_spr;

sprite_index = playerWalkingEquipped_spr;

draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, 1, 0, -1, 1);

draw_sprite_ext(spriteShotgun, -1, shotgunX, shotgunY, 1, 1, 0, -1, 1);
draw_sprite_ext(armSpriteCurvedShotgun, -1, shotgunArmCurvedX, shotgunArmCurvedY, 1, 1, 0, -1, 1);

draw_self()