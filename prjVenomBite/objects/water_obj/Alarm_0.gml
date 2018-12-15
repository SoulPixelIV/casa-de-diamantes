/// @description Spawn Particle

waterPart = instance_create_layer(x, y, "BackgroundObjects", particleBlue_obj);
waterPart.image_xscale = 1;
waterPart.image_yscale = 1;
waterPart.lightSize = 0.5;
waterPart.lightStrength = 1;
waterPart.lifespan = 400;
alarm[0] = spawnrate;
