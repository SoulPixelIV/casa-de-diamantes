movspeed = 0;
movspeedMax = -0.36;

voidEmitter = part_emitter_create(global.partSystem);

part_emitter_stream(global.partSystem, voidEmitter, global.voidPart, 30);

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


