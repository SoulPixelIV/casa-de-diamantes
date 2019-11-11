uPixelH = shader_get_uniform(testShader, "imageH");
uPixelW = shader_get_uniform(testShader, "imageW");

u_uvs = shader_get_uniform(testShader, "uvs");
var uvs_all = sprite_get_uvs(casinoBuilding_spr, 0);
uvs = [uvs_all[0], uvs_all[1], uvs_all[2], uvs_all[3]];

texelW = texture_get_texel_width(sprite_get_texture(casinoBuilding_spr, 0));
texelH = texture_get_texel_height(sprite_get_texture(casinoBuilding_spr, 0));
