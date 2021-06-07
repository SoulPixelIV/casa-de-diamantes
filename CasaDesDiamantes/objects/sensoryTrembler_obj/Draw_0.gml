if (!attackInProg2)
{
	draw_sprite_ext(sensoryTremblerBase_spr, -1, x, y - 12 + slamPos, 1, 1, baseRotation, -1, 1);
}
else
{
	draw_sprite_ext(sensoryTremblerBaseOpen_spr, -1, x, y - 12 + slamPos, 1, 1, baseRotation, -1, 1);
}

if (horspeed == 0)
{
	if (!attackInProg3)
	{
		draw_sprite_ext(sensoryTremblerBottom_spr, 0, x, y + 3 + slamPos, 1, 1, 0, -1, 1);
	}
	else
	{
		if (slamSprite)
		{
			draw_sprite_ext(sensoryTremblerBottomStretched_spr, 0, x, y + 3 + slamPos, 1, 1, 0, -1, 1);
		}
		else
		{
			draw_sprite_ext(sensoryTremblerBottom_spr, 0, x, y + 3 + slamPos, 1, 1, 0, -1, 1);
		}
	}
}
else
{
	draw_sprite_ext(sensoryTremblerBottomAnimated_spr, -1, x, y + 3 + slamPos, 1, 1, 0, -1, 1);
}