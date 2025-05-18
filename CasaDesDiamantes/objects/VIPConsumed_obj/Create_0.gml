hp = 70.0;
image_index = 0;
image_speed = 0;
animationSpeed = 0.4;
damageTint = false;
attackTint = false;
destroyedCollider = false;
dialogueTriggered = false;
burnt = false;
burnRes = 14;
burnTimer = 75;
burnTimerSave = burnTimer;
damageRes = 2;
hitable = true;

col = instance_create_layer(x + 38, y - 86, "Instances", colliderBoss_obj);
col.image_xscale = 0.7;
col.image_yscale = 12;

frozen = false;
freezeRes = 9999999;

attackTimer = 800;
attackTimer2 = 1500;

explosionTimer = 30;
dropTimer = 8;
deathTimer = 900;

attackTimerSave = attackTimer;

explosionTimerSave = explosionTimer + random_range(-5, 5);
dropTimerSave = dropTimer + random_range(-2,2);

//Particles
toxicEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, toxicEmitter, x - 320, x + 320, y - 150, y + 210, ps_shape_ellipse, ps_distr_gaussian);

damageTintTimer = 15;

attackTint = false;
damageTintTimer = 15;
attackTintTimer = 15;
attackTintDelay = 10;

damageTintTimerSave = damageTintTimer;
attackTimer2Save = attackTimer2;
attackTintTimerSave = attackTintTimer;
attackTintDelaySave = attackTintDelay;
attackTintDelay = -1;

fakegroundDestroyTimer = 200;

randNum = choose(4,6);

//Particle System
partEmitter = part_emitter_create(global.partSystem);