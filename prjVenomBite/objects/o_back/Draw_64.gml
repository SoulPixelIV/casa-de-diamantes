if (shader = 1) {
  shader_set(sh_aberration);
  shader_set_uniform_f(dis_u, dis);
}

draw_surface(application_surface, 0, 0);
shader_reset();




