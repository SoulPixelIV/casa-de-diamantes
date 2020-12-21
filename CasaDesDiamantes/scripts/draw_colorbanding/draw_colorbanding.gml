function draw_colorbanding(surface,x,y,smoothness) {
	// smoothness should be a value between 0 - 1
	shader_set(shd_colorbanding);
	
	shader_set_uniform_f(
		shader_get_uniform(shd_colorbanding,"smoothness"),
		smoothness
	);
	
	draw_surface(surface,x,y);
	
	shader_reset();
}

function draw_colorbanding_ext(surface,x,y,xscale,yscale,rot,col,alpha,smoothness) {
	// smoothness should be a value between 0 - 1
	shader_set(shd_colorbanding);
	
	shader_set_uniform_f(
		shader_get_uniform(shd_colorbanding,"smoothness"),
		smoothness
	);

	draw_surface_ext(surface,x,y,xscale,yscale,rot,col,alpha);
	
	window_set_size(camera_obj.xWindowSize, camera_obj.yWindowSize);
	surface_resize(application_surface, camera_obj.xScreenSize, camera_obj.yScreenSize);
	display_set_gui_size(camera_obj.xWindowSize / 2, camera_obj.yWindowSize / 2);
	
	shader_reset();
}

function draw_colorbanding_stretched(surface,x,y,w,h,smoothness) {
	// smoothness should be a value between 0 - 1
	shader_set(shd_colorbanding);
	
	shader_set_uniform_f(
		shader_get_uniform(shd_colorbanding,"smoothness"),
		smoothness
	);
	
	draw_surface_stretched(surface,x,y,w,h);
	
	shader_reset();
}