{
    "id": "be792f72-be98-42b0-ae0c-a700a30bb7c9",
    "modelName": "GMExtension",
    "mvc": "1.2",
    "name": "display_mouse_lock",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 113497714299118,
    "date": "2020-03-23 02:06:50",
    "description": "",
    "exportToGame": true,
    "extensionName": "",
    "files": [
        {
            "id": "2635d3ce-c824-44a6-b7a6-eb66022437c8",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 9223372036854775807,
            "filename": "display_mouse_lock.dll",
            "final": "",
            "functions": [
                {
                    "id": "1e8c6950-3998-4212-9772-ce0140ac3ef7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 4,
                    "args": [
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "display_mouse_lock",
                    "help": "display_mouse_lock(x, y, w, h) : Locks the cursor to the given rectangular area on screen.",
                    "hidden": false,
                    "kind": 11,
                    "name": "display_mouse_lock",
                    "returnType": 2
                },
                {
                    "id": "a58d9dd1-b6bb-484d-a177-956eb93a23b5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "display_mouse_unlock",
                    "help": "display_mouse_unlock() : Unlocks the cursor.",
                    "hidden": false,
                    "kind": 11,
                    "name": "display_mouse_unlock",
                    "returnType": 2
                },
                {
                    "id": "47714dde-cdd5-4de9-8101-21285111e4eb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "display_mouse_bounds_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "display_mouse_bounds_raw",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 1,
            "order": [
                "1e8c6950-3998-4212-9772-ce0140ac3ef7",
                "a58d9dd1-b6bb-484d-a177-956eb93a23b5",
                "47714dde-cdd5-4de9-8101-21285111e4eb"
            ],
            "origname": "extensions\\display_mouse_lock.dll",
            "uncompress": false
        },
        {
            "id": "8b0a1f4e-0abe-4075-87f9-cf2225bf5d28",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 9223372036854775807,
            "filename": "display_mouse_lock.gml",
            "final": "",
            "functions": [
                {
                    "id": "0b80aa7b-5fc8-431b-bddf-e9cc2daf8bac",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "display_mouse_bounds",
                    "help": "display_mouse_bounds() : Returns the current mouse' lock bounds (if any).",
                    "hidden": false,
                    "kind": 11,
                    "name": "display_mouse_bounds",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 2,
            "order": [
                "0b80aa7b-5fc8-431b-bddf-e9cc2daf8bac"
            ],
            "origname": "extensions\\gml.gml",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": true,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": "",
    "iosplistinject": "",
    "license": "Free to use, also for commercial games.",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "options": null,
    "optionsFile": "options.json",
    "packageID": "",
    "productID": "F79C97955FD1AF4686EB4EF4EF90F0DB",
    "sourcedir": "",
    "supportedTargets": 113497714299118,
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": "",
    "tvosdelegatename": "",
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "version": "1.0.0"
}