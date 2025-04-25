damage = 45;
knockback = 1;
damageCollision = true;
animationSpeed = 1;

light = instance_create_layer(x, y + 128, "GraphicsLayer", spotlightRed_obj);
light.body = id;
