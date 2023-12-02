movspeed = 0;
movspeedMax = -0.39;

voidEmitter = part_emitter_create(global.partSystem);

part_emitter_stream(global.partSystem, voidEmitter, global.voidPart, 1);

eyesEmitter = part_emitter_create(global.partSystem);

part_emitter_stream(global.partSystem, eyesEmitter, global.eyesPart, -30);

blackscreenDelay = 250;
whitescreenDelay = 250;
waitDelay = 150;
teleporting = false;
finishingTeleport = false;

blackscreenDelaySave = blackscreenDelay;
whitescreenDelaySave = whitescreenDelay;
waitDelaySave = waitDelay;


