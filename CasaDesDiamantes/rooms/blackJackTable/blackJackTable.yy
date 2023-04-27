{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "blackjackTable",
  "creationCodeFile": "${project_dir}/rooms/blackjackTable/RoomCreationCode.gml",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_7615C38","path":"rooms/blackjackTable/blackjackTable.yy",},
    {"name":"inst_3488CB4","path":"rooms/blackjackTable/blackjackTable.yy",},
    {"name":"inst_6619DE6","path":"rooms/blackjackTable/blackjackTable.yy",},
    {"name":"inst_362AD787","path":"rooms/blackjackTable/blackjackTable.yy",},
    {"name":"inst_7178DBD5","path":"rooms/blackjackTable/blackjackTable.yy",},
    {"name":"inst_4FFCE7E2","path":"rooms/blackjackTable/blackjackTable.yy",},
    {"name":"inst_2D467059","path":"rooms/blackjackTable/blackjackTable.yy",},
    {"name":"inst_5875F358","path":"rooms/blackjackTable/blackjackTable.yy",},
    {"name":"inst_13F971E1","path":"rooms/blackjackTable/blackjackTable.yy",},
    {"name":"inst_18977418","path":"rooms/blackjackTable/blackjackTable.yy",},
    {"name":"inst_754EAC24","path":"rooms/blackjackTable/blackjackTable.yy",},
    {"name":"inst_32E55D75","path":"rooms/blackjackTable/blackjackTable.yy",},
    {"name":"inst_5177DEF5","path":"rooms/blackjackTable/blackjackTable.yy",},
    {"name":"inst_3F3F6BDE","path":"rooms/blackjackTable/blackjackTable.yy",},
    {"name":"inst_21ECEAA7","path":"rooms/blackjackTable/blackjackTable.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"GameManagerLayer","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3488CB4","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_light_renderer","path":"objects/obj_light_renderer/obj_light_renderer.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":0.0,"y":0.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6619DE6","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"blackJackCalc_obj","path":"objects/blackJackCalc_obj/blackJackCalc_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":96.0,"y":0.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_2D467059","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"cameraBlackjack_obj","path":"objects/cameraBlackjack_obj/cameraBlackjack_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":239.0,"y":134.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5875F358","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"text","path":"objects/button_obj/button_obj.yy",},"value":"50",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"bet50","path":"objects/button_obj/button_obj.yy",},"value":"True",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":160.0,"y":128.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_13F971E1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"text","path":"objects/button_obj/button_obj.yy",},"value":"500",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"bet500","path":"objects/button_obj/button_obj.yy",},"value":"True",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":320.0,"y":128.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_18977418","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"text","path":"objects/button_obj/button_obj.yy",},"value":"START",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"bet500","path":"objects/button_obj/button_obj.yy",},"value":"False",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"start","path":"objects/button_obj/button_obj.yy",},"value":"True",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":240.0,"y":205.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_754EAC24","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"text","path":"objects/button_obj/button_obj.yy",},"value":"STAND",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"bet50","path":"objects/button_obj/button_obj.yy",},"value":"False",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"stand","path":"objects/button_obj/button_obj.yy",},"value":"True",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":96.0,"y":192.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_32E55D75","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"text","path":"objects/button_obj/button_obj.yy",},"value":"HIT",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"bet50","path":"objects/button_obj/button_obj.yy",},"value":"False",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"stand","path":"objects/button_obj/button_obj.yy",},"value":"False",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"hit","path":"objects/button_obj/button_obj.yy",},"value":"True",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":96.0,"y":96.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5177DEF5","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"text","path":"objects/button_obj/button_obj.yy",},"value":"CONTINUE",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"bet50","path":"objects/button_obj/button_obj.yy",},"value":"False",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"stand","path":"objects/button_obj/button_obj.yy",},"value":"False",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"button_obj","path":"objects/button_obj/button_obj.yy",},"propertyId":{"name":"back","path":"objects/button_obj/button_obj.yy",},"value":"True",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":240.0,"y":205.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"GraphicsLayer","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7615C38","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"spotlightRed_obj","path":"objects/spotlightRed_obj/spotlightRed_obj.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_light","path":"objects/obj_light/obj_light.yy",},"propertyId":{"name":"Light_Range","path":"objects/obj_light/obj_light.yy",},"value":"600",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":384.0,"y":64.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_4FFCE7E2","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"spotlightYellow_obj","path":"objects/spotlightYellow_obj/spotlightYellow_obj.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_light","path":"objects/obj_light/obj_light.yy",},"propertyId":{"name":"Light_Range","path":"objects/obj_light/obj_light.yy",},"value":"300",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":64.0,"y":64.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3F3F6BDE","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"spotlightPink_obj","path":"objects/spotlightPink_obj/spotlightPink_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":460.0,"y":251.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_21ECEAA7","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"spotlightPink_obj","path":"objects/spotlightPink_obj/spotlightPink_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":2.0,"y":253.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"VoidBackground","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":9,"SerialiseWidth":15,"TileCompressedData":[
-135,0,],"TileDataFormat":1,},"tilesetId":{"name":"voidBackground","path":"tilesets/voidBackground/voidBackground.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"ForegroundObjects","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"TileCollider","depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7178DBD5","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"collider_obj","path":"objects/collider_obj/collider_obj.yy",},"properties":[],"rotation":0.0,"scaleX":2.0,"scaleY":1.0,"x":544.0,"y":96.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles","depth":600,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":9,"SerialiseWidth":15,"TileCompressedData":[
-135,0,],"TileDataFormat":1,},"tilesetId":{"name":"caveTilesOld","path":"tilesets/caveTilesOld/caveTilesOld.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"BackgroundObjects","depth":700,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"BackgroundObjects2","depth":800,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_362AD787","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"blackjackBackground_obj","path":"objects/blackjackBackground_obj/blackjackBackground_obj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":0.0,"y":0.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"BackgroundAssets","depth":900,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"BackgroundObjects3","depth":1000,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"BlurFilter","depth":1100,"effectEnabled":true,"effectType":"_filter_large_blur","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_Radius","type":0,"value":"10",},
        {"name":"g_NoiseTexture","type":2,"value":"_filter_large_blur_noise",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"CasinoTiles","depth":1200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":9,"SerialiseWidth":15,"TileCompressedData":[
-135,0,],"TileDataFormat":1,},"tilesetId":{"name":"casinoTiles","path":"tilesets/casinoTiles/casinoTiles.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"CasinoBackgroundTiles","depth":1300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":9,"SerialiseWidth":15,"TileCompressedData":[
-135,0,],"TileDataFormat":1,},"tilesetId":{"name":"casinoTiles","path":"tilesets/casinoTiles/casinoTiles.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"CaveBackgroundTiles","depth":1400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":9,"SerialiseWidth":15,"TileCompressedData":[
-135,0,],"TileDataFormat":1,},"tilesetId":{"name":"caveBackgroundTiles","path":"tilesets/caveBackgroundTiles/caveBackgroundTiles.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Background","depth":1500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Background2","depth":1600,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
  ],
  "parent": {
    "name": "Hub",
    "path": "folders/Levels/Main/Hub.yy",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 0.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 270,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 480,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":720,"hspeed":1,"hview":270,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":1,"wport":1280,"wview":480,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": true,
    "enableViews": true,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}