draw_self();
draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_center);

draw_set_color(c_black);
draw_text(global.xScreenSize / 2 - 1, 16 + 1, "Cindy's Equipment");
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(global.xScreenSize / 2, 16, "Cindy's Equipment");

draw_set_color(c_black);
draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 5.5 + 1, "- Select an Upgrade -");
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(global.xScreenSize / 2, global.yScreenSize / 5.5, "- Select an Upgrade -");

draw_set_color(c_black);
draw_text(global.xScreenSize / 2 - 1, (global.yScreenSize - 14) + 1, explanationText);
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(global.xScreenSize / 2, global.yScreenSize - 14, explanationText);

/*
cursorAnim += global.dtNoSlowmo / 17;
switch (cursorPos)
{
	case 0:
		draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 64, global.yScreenSize / 3 + 64 + 4);
	break;
	case 1:
		draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 64, global.yScreenSize / 3 + 64 + 18 + 4);
	break;
	case 2:
		draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 64, global.yScreenSize / 3 + 64 + 36 + 4);
	break;
}
*/

//Chipbar Digit Calculation
convMoney = string(global.money);
slots = [0,0,0,0,0,0,0];
	
convMoneyLen = string_length(convMoney); //3000 = 4
var normIndex = 1;
	
//Fill all digits with Zeros first
for (i = 0; i < 7; i++) {
	slots[i] = 0;
}
	
//Fill last digits with money count
for (i = array_length(slots) - convMoneyLen; i < 7; i++) {
	slots[i] = int64(string_char_at(convMoney, normIndex));
	normIndex ++; //Index starting at 0 for convMoney reading
}

draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_text(global.xScreenSize / 2 - 1, (global.yScreenSize / 2) + 96 + 1, "Press Esc to Exit");
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(global.xScreenSize / 2, (global.yScreenSize / 2) + 96, "Press Esc to Exit");
draw_set_halign(fa_left);

//Chipbar
draw_sprite_ext(scoreBorder_spr, -1, global.xScreenSize - 11, 11, 1, 1, 0, -1, 1);

if (scoreSpin)
{
	scoreSpinTimer -= global.dt;
	draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 21, 12 + (0 / 2));
	draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 31, 12 + (0 / 2));
	draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 41, 12 + (0 / 2));
	draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 51, 12 + (0 / 2));
	draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 61, 12 + (0 / 2));
	draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 71, 12 + (0 / 2));
	draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 81, 12 + (0 / 2));
}
else
{
	draw_sprite(scoreNumber_spr, slots[6], global.xScreenSize - 21, 12 + (0 / 2));
	draw_sprite(scoreNumber_spr, slots[5], global.xScreenSize - 31, 12 + (0 / 2));
	draw_sprite(scoreNumber_spr, slots[4], global.xScreenSize - 41, 12 + (0 / 2));
	draw_sprite(scoreNumber_spr, slots[3], global.xScreenSize - 51, 12 + (0 / 2));
	draw_sprite(scoreNumber_spr, slots[2], global.xScreenSize - 61, 12 + (0 / 2));
	draw_sprite(scoreNumber_spr, slots[1], global.xScreenSize - 71, 12 + (0 / 2));
	draw_sprite(scoreNumber_spr, slots[0], global.xScreenSize - 81, 12 + (0 / 2));
}
	
if (scoreSpinTimer < 0)
{
	scoreSpinTimer = scoreSpinTimerSave;
	scoreSpin = false;
}
