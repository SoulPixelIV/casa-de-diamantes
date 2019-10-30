var blur_steps = 31 + 1;
var kernel = blur_steps * 2 + 1;
var kernel_squared = kernel * kernel;

shader_set(shader);
	draw_self();
	shader_set_uniform_f(u_blur_steps, blur_steps);
	shader_set_uniform_f(u_texel_size, texel_w, texel_h);
	shader_set_uniform_f(u_sample_weight, 1 / kernel_squared);
	draw_sprite(sprite_blur, 0, 0, 0);
shader_reset();

var samplesPerImage = kernel_squared * image_w * image_h;

draw_text(200, 200, "Steps: " + string(blur_steps) +
"\nKernel: " + string(kernel) + " x " + string(kernel) +
"\n\n\nSamples/px: " + string(kernel_squared) +
"\nSamples/img: " + string(samplesPerImage));

