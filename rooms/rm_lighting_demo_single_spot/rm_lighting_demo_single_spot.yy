
{
    "name": "rm_lighting_demo_single_spot",
    "id": "ebda08eb-a49a-423f-ae58-b90f7caabf86",
    "creationCodeFile": "",
    "inheritCode": false,
    "inheritCreationOrder": false,
    "inheritLayers": false,
    "instanceCreationOrderIDs": [
        "c3e81d48-438e-43eb-ad76-fcac979774a9",
        "43c24b20-aa28-43c1-853c-9ab2f2c5f0be",
        "968b0425-36bc-4856-8bba-08943cb13cfa",
        "27cec80b-e84d-46e3-b45e-1d9c0116ded7",
        "127d07bd-f7f9-4dc9-8083-72e904bb3542",
        "b8c21d7b-bf99-4acf-8203-b6c8f77d00e3",
        "e04826a0-d4ca-4210-ae44-c71c1f0e89fd",
        "9a4fbd5c-df2d-459a-9e79-70f3887f3d21"
    ],
    "IsDnD": true,
    "layers": [
        {
            "__type": "GMRInstanceLayer_Model:#YoYoStudio.MVCFormat",
            "name": "Init",
            "id": "3b38751e-9fdc-4d20-ab20-d5aa99321fef",
            "depth": 0,
            "grid_x": 16,
            "grid_y": 16,
            "hierarchyFrozen": false,
            "hierarchyVisible": true,
            "inheritLayerDepth": false,
            "inheritLayerSettings": false,
            "inheritSubLayers": false,
            "inheritVisibility": false,
            "instances": [
{"name": "inst_1D01322","id": "968b0425-36bc-4856-8bba-08943cb13cfa","colour": { "Value": 4294967295 },"creationCodeFile": "","creationCodeType": "","ignore": false,"inheritCode": false,"inheritItemSettings": false,"IsDnD": false,"m_originalParentID": "00000000-0000-0000-0000-000000000000","m_serialiseFrozen": false,"modelName": "GMRInstance","name_with_no_file_rename": "inst_1D01322","objId": "7f43fcf2-4430-4486-b62a-9fe678bcd529","properties": null,"rotation": 0,"scaleX": 1,"scaleY": 1,"mvc": "1.0","x": -32,"y": -48},
{"name": "inst_7A66B006","id": "b8c21d7b-bf99-4acf-8203-b6c8f77d00e3","colour": { "Value": 4294967295 },"creationCodeFile": "","creationCodeType": "","ignore": false,"inheritCode": false,"inheritItemSettings": false,"IsDnD": false,"m_originalParentID": "00000000-0000-0000-0000-000000000000","m_serialiseFrozen": false,"modelName": "GMRInstance","name_with_no_file_rename": "inst_7A66B006","objId": "135f5d09-6a8c-4662-b240-e602b0c1521b","properties": null,"rotation": 0,"scaleX": 1,"scaleY": 1,"mvc": "1.0","x": 144,"y": -80},
{"name": "inst_6408455F","id": "e04826a0-d4ca-4210-ae44-c71c1f0e89fd","colour": { "Value": 4294967295 },"creationCodeFile": "","creationCodeType": "","ignore": false,"inheritCode": false,"inheritItemSettings": false,"IsDnD": false,"m_originalParentID": "00000000-0000-0000-0000-000000000000","m_serialiseFrozen": false,"modelName": "GMRInstance","name_with_no_file_rename": "inst_6408455F","objId": "66947509-46ee-4ff2-8ea0-b59bdda06d0b","properties": null,"rotation": 0,"scaleX": 1,"scaleY": 1,"mvc": "1.0","x": 512,"y": -64}
            ],
            "layers": [

            ],
            "m_parentID": "00000000-0000-0000-0000-000000000000",
            "m_serialiseFrozen": false,
            "modelName": "GMRInstanceLayer",
            "mvc": "1.0",
            "userdefined_depth": false,
            "visible": true
        },
        {
            "__type": "GMRInstanceLayer_Model:#YoYoStudio.MVCFormat",
            "name": "Lights",
            "id": "223e9de1-c2f1-4257-822a-6e494d520bfe",
            "depth": 100,
            "grid_x": 16,
            "grid_y": 16,
            "hierarchyFrozen": false,
            "hierarchyVisible": true,
            "inheritLayerDepth": false,
            "inheritLayerSettings": false,
            "inheritSubLayers": false,
            "inheritVisibility": false,
            "instances": [
{"name": "inst_49EAA3","id": "9a4fbd5c-df2d-459a-9e79-70f3887f3d21","colour": { "Value": 4294967295 },"creationCodeFile": "","creationCodeType": "","ignore": false,"inheritCode": false,"inheritItemSettings": false,"IsDnD": false,"m_originalParentID": "00000000-0000-0000-0000-000000000000","m_serialiseFrozen": false,"modelName": "GMRInstance","name_with_no_file_rename": "inst_49EAA3","objId": "5a694e64-bfbe-429e-80c4-8b76deabcb0a","properties": [{"id": "cb0dc9c8-028c-473a-98ec-bd1796b11f1e","modelName": "GMOverriddenProperty","objectId": "84334f4e-b6d2-4ffe-89cf-f8641f75877e","propertyId": "acc21797-5541-499d-a7a7-ca1316572c37","mvc": "1.0","value": "$E9FFD400"},{"id": "5d0dc62a-50ee-43d7-92db-aeb39558cab8","modelName": "GMOverriddenProperty","objectId": "84334f4e-b6d2-4ffe-89cf-f8641f75877e","propertyId": "1a4e0384-2c2a-48c1-86ff-1579eb84c5fa","mvc": "1.0","value": "1024"}],"rotation": 0,"scaleX": 1,"scaleY": 1,"mvc": "1.0","x": 1024,"y": 496}
            ],
            "layers": [

            ],
            "m_parentID": "00000000-0000-0000-0000-000000000000",
            "m_serialiseFrozen": false,
            "modelName": "GMRInstanceLayer",
            "mvc": "1.0",
            "userdefined_depth": false,
            "visible": true
        },
        {
            "__type": "GMRInstanceLayer_Model:#YoYoStudio.MVCFormat",
            "name": "Shadow_Map",
            "id": "dc5153c9-c653-4878-bab3-55c5838fe81f",
            "depth": 200,
            "grid_x": 16,
            "grid_y": 16,
            "hierarchyFrozen": false,
            "hierarchyVisible": true,
            "inheritLayerDepth": false,
            "inheritLayerSettings": false,
            "inheritSubLayers": false,
            "inheritVisibility": false,
            "instances": [
{"name": "inst_B23AB53","id": "127d07bd-f7f9-4dc9-8083-72e904bb3542","colour": { "Value": 4294967295 },"creationCodeFile": "","creationCodeType": "","ignore": false,"inheritCode": false,"inheritItemSettings": false,"IsDnD": false,"m_originalParentID": "00000000-0000-0000-0000-000000000000","m_serialiseFrozen": false,"modelName": "GMRInstance","name_with_no_file_rename": "inst_B23AB53","objId": "6c059270-2efd-43c1-ab15-1a0f3e12454b","properties": null,"rotation": 0,"scaleX": 1,"scaleY": 1,"mvc": "1.0","x": 112,"y": -80}
            ],
            "layers": [

            ],
            "m_parentID": "00000000-0000-0000-0000-000000000000",
            "m_serialiseFrozen": false,
            "modelName": "GMRInstanceLayer",
            "mvc": "1.0",
            "userdefined_depth": false,
            "visible": true
        },
        {
            "__type": "GMRInstanceLayer_Model:#YoYoStudio.MVCFormat",
            "name": "Instances",
            "id": "7ff69bdd-6f2e-4c1c-a297-cbc5365af720",
            "depth": 300,
            "grid_x": 8,
            "grid_y": 8,
            "hierarchyFrozen": false,
            "hierarchyVisible": true,
            "inheritLayerDepth": false,
            "inheritLayerSettings": false,
            "inheritSubLayers": false,
            "inheritVisibility": false,
            "instances": [
{"name": "inst_17B0B72C","id": "c3e81d48-438e-43eb-ad76-fcac979774a9","colour": { "Value": 4294967295 },"creationCodeFile": "","creationCodeType": "","ignore": false,"inheritCode": false,"inheritItemSettings": false,"IsDnD": false,"m_originalParentID": "00000000-0000-0000-0000-000000000000","m_serialiseFrozen": false,"modelName": "GMRInstance","name_with_no_file_rename": "inst_17B0B72C","objId": "a3fd981d-7e05-49bb-ac3b-18c7adf343d0","properties": null,"rotation": 0,"scaleX": 1,"scaleY": 1,"mvc": "1.0","x": 712,"y": 208},
{"name": "inst_47F80FC9","id": "43c24b20-aa28-43c1-853c-9ab2f2c5f0be","colour": { "Value": 4294967295 },"creationCodeFile": "","creationCodeType": "","ignore": false,"inheritCode": false,"inheritItemSettings": false,"IsDnD": false,"m_originalParentID": "00000000-0000-0000-0000-000000000000","m_serialiseFrozen": false,"modelName": "GMRInstance","name_with_no_file_rename": "inst_47F80FC9","objId": "a3fd981d-7e05-49bb-ac3b-18c7adf343d0","properties": null,"rotation": 0,"scaleX": 1,"scaleY": 1,"mvc": "1.0","x": 1392,"y": 376},
{"name": "inst_5E946D83","id": "27cec80b-e84d-46e3-b45e-1d9c0116ded7","colour": { "Value": 4294967295 },"creationCodeFile": "","creationCodeType": "","ignore": false,"inheritCode": false,"inheritItemSettings": false,"IsDnD": false,"m_originalParentID": "00000000-0000-0000-0000-000000000000","m_serialiseFrozen": false,"modelName": "GMRInstance","name_with_no_file_rename": "inst_5E946D83","objId": "a3fd981d-7e05-49bb-ac3b-18c7adf343d0","properties": null,"rotation": 0,"scaleX": 1,"scaleY": 1,"mvc": "1.0","x": 912,"y": 712}
            ],
            "layers": [

            ],
            "m_parentID": "00000000-0000-0000-0000-000000000000",
            "m_serialiseFrozen": false,
            "modelName": "GMRInstanceLayer",
            "mvc": "1.0",
            "userdefined_depth": false,
            "visible": true
        },
        {
            "__type": "GMRBackgroundLayer_Model:#YoYoStudio.MVCFormat",
            "name": "Background",
            "id": "f9028a5d-a33a-469e-9e91-aa465a6980bc",
            "animationFPS": 15,
            "animationSpeedType": "0",
            "colour": { "Value": 4294967295 },
            "depth": 400,
            "grid_x": 16,
            "grid_y": 16,
            "hierarchyFrozen": false,
            "hierarchyVisible": true,
            "hspeed": 0,
            "htiled": true,
            "inheritLayerDepth": false,
            "inheritLayerSettings": false,
            "inheritSubLayers": false,
            "inheritVisibility": false,
            "layers": [

            ],
            "m_parentID": "00000000-0000-0000-0000-000000000000",
            "m_serialiseFrozen": false,
            "modelName": "GMRBackgroundLayer",
            "mvc": "1.0",
            "spriteId": "af573f4b-e624-416b-9025-e9edbf6acb1e",
            "stretch": false,
            "userdefined_animFPS": false,
            "userdefined_depth": false,
            "visible": true,
            "vspeed": 0,
            "vtiled": true,
            "x": 0,
            "y": 0
        }
    ],
    "modelName": "GMRoom",
    "parentId": "00000000-0000-0000-0000-000000000000",
    "physicsSettings":     {
        "id": "51cbbf1b-4007-42f7-a4b7-f0e5f5ffb28d",
        "inheritPhysicsSettings": false,
        "modelName": "GMRoomPhysicsSettings",
        "PhysicsWorld": false,
        "PhysicsWorldGravityX": 0,
        "PhysicsWorldGravityY": 10,
        "PhysicsWorldPixToMeters": 0.1,
        "mvc": "1.0"
    },
    "roomSettings":     {
        "id": "b21a9cc5-dc5b-4d48-96b1-f914df3fc621",
        "Height": 1800,
        "inheritRoomSettings": false,
        "modelName": "GMRoomSettings",
        "persistent": false,
        "mvc": "1.0",
        "Width": 3200
    },
    "mvc": "1.0",
    "views": [
{"id": "5b874b7e-4efb-4ee0-8a44-190c7f161193","hborder": 32,"hport": 1080,"hspeed": -1,"hview": 1080,"inherit": false,"modelName": "GMRView","objId": "00000000-0000-0000-0000-000000000000","mvc": "1.0","vborder": 32,"visible": true,"vspeed": -1,"wport": 1920,"wview": 1920,"xport": 0,"xview": 25,"yport": 0,"yview": 0},
{"id": "8b19dcee-ebfb-488d-ad85-043dcb1296b3","hborder": 32,"hport": 768,"hspeed": -1,"hview": 768,"inherit": false,"modelName": "GMRView","objId": "00000000-0000-0000-0000-000000000000","mvc": "1.0","vborder": 32,"visible": false,"vspeed": -1,"wport": 1024,"wview": 1024,"xport": 0,"xview": 0,"yport": 0,"yview": 0},
{"id": "3f7d565e-7b17-4c3e-bb63-69c58b5cc50a","hborder": 32,"hport": 768,"hspeed": -1,"hview": 768,"inherit": false,"modelName": "GMRView","objId": "00000000-0000-0000-0000-000000000000","mvc": "1.0","vborder": 32,"visible": false,"vspeed": -1,"wport": 1024,"wview": 1024,"xport": 0,"xview": 0,"yport": 0,"yview": 0},
{"id": "e8a1bbce-c0a5-4a8f-acf1-4e3655ea5bbc","hborder": 32,"hport": 768,"hspeed": -1,"hview": 768,"inherit": false,"modelName": "GMRView","objId": "00000000-0000-0000-0000-000000000000","mvc": "1.0","vborder": 32,"visible": false,"vspeed": -1,"wport": 1024,"wview": 1024,"xport": 0,"xview": 0,"yport": 0,"yview": 0},
{"id": "2c6d4341-046a-405b-9590-7232c88fd664","hborder": 32,"hport": 768,"hspeed": -1,"hview": 768,"inherit": false,"modelName": "GMRView","objId": "00000000-0000-0000-0000-000000000000","mvc": "1.0","vborder": 32,"visible": false,"vspeed": -1,"wport": 1024,"wview": 1024,"xport": 0,"xview": 0,"yport": 0,"yview": 0},
{"id": "a37084f9-7dc3-4cf3-a242-8b95a0fefd57","hborder": 32,"hport": 768,"hspeed": -1,"hview": 768,"inherit": false,"modelName": "GMRView","objId": "00000000-0000-0000-0000-000000000000","mvc": "1.0","vborder": 32,"visible": false,"vspeed": -1,"wport": 1024,"wview": 1024,"xport": 0,"xview": 0,"yport": 0,"yview": 0},
{"id": "a875230c-4e79-4f2d-a170-cf82d468f387","hborder": 32,"hport": 768,"hspeed": -1,"hview": 768,"inherit": false,"modelName": "GMRView","objId": "00000000-0000-0000-0000-000000000000","mvc": "1.0","vborder": 32,"visible": false,"vspeed": -1,"wport": 1024,"wview": 1024,"xport": 0,"xview": 0,"yport": 0,"yview": 0},
{"id": "672ffded-f423-4412-b5b2-1bb9fdba3fc2","hborder": 32,"hport": 768,"hspeed": -1,"hview": 768,"inherit": false,"modelName": "GMRView","objId": "00000000-0000-0000-0000-000000000000","mvc": "1.0","vborder": 32,"visible": false,"vspeed": -1,"wport": 1024,"wview": 1024,"xport": 0,"xview": 0,"yport": 0,"yview": 0}
    ],
    "viewSettings":     {
        "id": "4aff77b6-c5c6-4d7d-9fed-5ec69dc74536",
        "clearDisplayBuffer": true,
        "clearViewBackground": false,
        "enableViews": true,
        "inheritViewSettings": false,
        "modelName": "GMRoomViewSettings",
        "mvc": "1.0"
    }
}