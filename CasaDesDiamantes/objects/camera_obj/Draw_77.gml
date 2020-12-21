/*shader_set(shd_colorbanding);
	
shader_set_uniform_f(
	shader_get_uniform(shd_colorbanding,"smoothness"),
	smoothness
); */

if (!window_get_fullscreen())
{
	draw_surface_ext(application_surface, 0, 0, 2, 2, 0, -1, 1);
}
else
{
	draw_surface_ext(application_surface, 0, 0, 4, 4, 0, -1, 1);
}
