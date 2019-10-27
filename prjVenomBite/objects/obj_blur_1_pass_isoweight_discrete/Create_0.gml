sprite_blur = player_spr_Backup;
shader = shd_blur_1_pass_isoweight_discrete;

u_blur_steps = shader_get_uniform(shader, "blur_steps");
u_sample_weight = shader_get_uniform(shader, "sample_weight");
u_texel_size = shader_get_uniform(shader, "textel_size");

var uvs_all = sprite_get_uvs(sprite_blur, 0);
image_w = sprite_get_width(sprite_blur);
image_h = sprite_get_height(sprite_blur);

texel_w = (uvs_all[2] - uvs_all[0]) / image_w;
texel_h = (uvs_all[3] - uvs_all[1]) / image_h;