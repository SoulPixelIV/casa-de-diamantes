draw_set_font(standard_fnt);
draw_set_color(c_black);
for (i = 0; i < array_length_1d(value); i++)
{
	draw_text(1264 - (i*16), 0, value[i]);
}
