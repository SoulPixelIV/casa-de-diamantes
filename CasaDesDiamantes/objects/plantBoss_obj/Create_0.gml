hp = 100;
image_index = 0;
image_speed = 0;
damageTint = false;
attackTint = false;
startBattle = false;

frozen = false;
freezeRes = 9999999;

attackTimer = 800;
attackTimer2 = 350;

explosionTimer = 30;
dropTimer = 8;
deathTimer = 1350;

attackTimerSave = attackTimer;

explosionTimerSave = explosionTimer + random_range(-5, 5);
dropTimerSave = dropTimer + random_range(-2,2);

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