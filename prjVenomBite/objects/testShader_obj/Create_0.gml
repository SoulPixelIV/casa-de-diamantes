uPixelH = shader_get_uniform(testShader, "imageH");
uPixelW = shader_get_uniform(testShader, "imageW");

texelW = texture_get_texel_width(sprite_get_texture(plagueDoor_spr, 0));
texelH = texture_get_texel_height(sprite_get_texture(plagueDoor_spr, 0));
