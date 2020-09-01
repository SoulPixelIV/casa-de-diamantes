shader_set(bwShader);
shader_set_uniform_f(uPixelH, texelH);
shader_set_uniform_f(uPixelW, texelW);
shader_set_uniform_f_array(u_uvs, uvs);
draw_self();
shader_reset();