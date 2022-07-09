spawnTimer = random_range(0.5,1.2);
liveTimer = 250;
xPos = 0;
dir = 0;

hitboxFlowerAttack = instance_create_layer(x + 42 * dir, y, "Instances", damageHitbox_obj);

hitboxFlowerAttack.image_yscale = 3;
hitboxFlowerAttack.image_xscale = 2;
hitboxFlowerAttack.damage = 30;
hitboxFlowerAttack.timer = 300;