//silence -= global.dt;

if (silence < 0)
{
	music = choose(beatLow_msc, beatMid_msc, beatHigh_msc);
	with (player_obj)
	{
		if (place_meeting(x, y, battleArena_obj))
		{
			with (musicManager_obj)
			{
				music = choose(beatVeryHigh_msc, beatIntense_msc);
			}
		}
	}
	if (!audio_is_playing(beatLow_msc) && !audio_is_playing(beatMid_msc) && !audio_is_playing(beatHigh_msc) && !audio_is_playing(beatVeryHigh_msc) && !audio_is_playing(beatIntense_msc))
	{
		var track = audio_play_sound(music, 1, false);
		audio_sound_pitch(track, random_range(0.9, 1.1));
	}
	directContinue = choose(true, false);
	silence = random_range(50, 12000);
}

if (directContinue && !audio_is_playing(music))
{
	silence = 0;
}

with (player_obj)
{
	if (place_meeting(x, y, battleArena_obj))
	{
		with (musicManager_obj)
		{
			if (silence > 100)
			{
				silence = 100;
			}
		}
	}
}

//Casino Theme
if (room == level_Casino) {
	if (!audio_is_playing(casinoTheme)) {
		audio_play_sound(casinoTheme, 1, true);
	}
} else {
	if (audio_is_playing(casinoTheme)) {
		audio_stop_sound(casinoTheme);
	}
}