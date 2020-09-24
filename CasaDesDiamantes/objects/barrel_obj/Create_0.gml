event_inherited();
polygon = polygon_from_instance(id);

horspeed = 0;
verspeed = 0;
hp = 120;
level = 1;
damage = 15;
points = 125;
knockback = 5;
movSpeed = 0.45;
gravityStrength = -0.32;

barrelTrigger = instance_create_layer(x, y, "Instances", barrelTrigger_obj);
