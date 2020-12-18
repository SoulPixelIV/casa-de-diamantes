var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera,vm);

//Coinbar
if (scoreSpin)
{
	if (!audio_is_playing(coinbarSpin_snd))
	{
		spinsnd = audio_play_sound(coinbarSpin_snd, 1, false);
	}
	playScoreStop = true;
}
else
{
	if (playScoreStop)
	{
		audio_play_sound(coinbarStop_snd, 1, false);
		audio_stop_sound(spinsnd);
		playScoreStop = false;
	}
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;