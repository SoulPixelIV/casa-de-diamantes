draw_set_font(standard_fnt);
draw_set_color(make_color_rgb(0, 0, 15));
for (i = 0; i < array_length_1d(value); i++)
{
	draw_text(1064 - (i*16), 22, value[i]);
}
