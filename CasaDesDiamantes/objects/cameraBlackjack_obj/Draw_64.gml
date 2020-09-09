if (blackJackCalc_obj.screen == 0)
{
	draw_set_color(c_black);
	draw_set_alpha(0.7);
	//draw_rectangle(0, 0, xScreenSize, yScreenSize, false);
	draw_set_alpha(1);
}

//Chipbar
draw_sprite_ext(scoreBorder_spr, -1, 375, edgeMarginVer, 1, 1, 0, -1, 1);
	
if (scoreSpin)
{
	scoreSpinTimer -= global.dt;
	draw_sprite(scoreNumberSpin_spr, -1, 452, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 442, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 432, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 422, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 412, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 402, edgeMarginVer + 2);
	draw_sprite(scoreNumberSpin_spr, -1, 392, edgeMarginVer + 2);
}
else
{
	draw_sprite(scoreNumber_spr, digitsManager_obj.value[0], 452, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, digitsManager_obj.value[1], 442, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, digitsManager_obj.value[2], 432, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, digitsManager_obj.value[3], 422, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, digitsManager_obj.value[4], 412, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, digitsManager_obj.value[5], 402, edgeMarginVer + 2);
	draw_sprite(scoreNumber_spr, digitsManager_obj.value[6], 392, edgeMarginVer + 2);
}
	
if (scoreSpinTimer < 0)
{
	scoreSpinTimer = scoreSpinTimerSave;
	scoreSpin = false;
}
