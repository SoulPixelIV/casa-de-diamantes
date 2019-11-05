shader_set(testShader);
shader_set_uniform_f(uPixelH, texelH);
shader_set_uniform_f(uPixelW, texelW);
draw_self();
shader_reset();