for (var i = 0; room_exists(i); i++)
    global.roomlist[i] = room_get_name(i);

for (var i = 0; object_exists(i); i++)
    global.objectlist[i] = object_get_name(i);

for (var i = 0; sprite_exists(i); i++)
    global.spritelist[i] = sprite_get_name(i);

function sh_escape()
{
    var arg0 = string(argument0[1]);
    var arg1 = argument0[2];
    var arg2 = argument0[3];
    
    switch (arg0)
    {
        case "true":
        case "1":
            arg0 = true;
            break;
        
        case "false":
        case "0":
            arg0 = false;
            break;
        
        default:
            arg0 = !global.panic;
            break;
    }
    
    global.panic = arg0;
    global.minutes = real(string_digits(arg1));
    global.seconds = real(string_digits(arg2));
    global.wave = 0;
    global.maxwave = ((global.minutes * 60) + global.seconds) * 60;
    obj_camera.alarm[1] = 60;
    
    if (!instance_exists(obj_panicchanger))
        instance_create(x, y, obj_panicchanger);
}

function meta_escape()
{
    return 
    {
        description: "activates escape and sets escape time",
        arguments: ["<bool>", "<min>", "<sec>"],
        suggestions: [["true", "false"], [], []],
        argumentDescriptions: ["activate/deactivate escape", "set minutes", "set seconds"]
    };
}

function sh_toggle_collisions()
{
    var arg1 = argument0[1];
    
    switch (arg1)
    {
        case "true":
        case "1":
            arg1 = true;
            break;
        
        case "false":
        case "0":
            arg1 = false;
            break;
        
        default:
            arg1 = !global.showcollisions;
            break;
    }
    
    global.showcollisions = arg1;
    toggle_collision_function();
}

function meta_toggle_collisions()
{
    return 
    {
        description: "toggles collision object visibility",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["toggles visibility"]
    };
}

function toggle_collision_function()
{
    if (!variable_global_exists("showcollisionarray"))
    {
        i = 0;
        global.showcollisionarray[i++] = obj_solid;
        global.showcollisionarray[i++] = obj_cameraRegion;
        global.showcollisionarray[i++] = obj_slope;
        global.showcollisionarray[i++] = obj_slopeplatform;
        global.showcollisionarray[i++] = obj_platform;
        global.showcollisionarray[i++] = obj_cottonplatform;
        global.showcollisionarray[i++] = obj_traingo;
        global.showcollisionarray[i++] = obj_traindestroy;
        global.showcollisionarray[i++] = obj_trainSlowDownTrigger;
        global.showcollisionarray[i++] = obj_trainSpeedUpTrigger;
        global.showcollisionarray[i++] = obj_secretdestroyable;
        global.showcollisionarray[i++] = obj_secretdestroyable_big;
        global.showcollisionarray[i++] = obj_secretdestroyable_metal;
        global.showcollisionarray[i++] = obj_secretdestroyable_tiles2;
        global.showcollisionarray[i++] = obj_secretdestroyable_tiles3;
        global.showcollisionarray[i++] = obj_secretdestroyable_tiles4;
        global.showcollisionarray[i++] = obj_secretdestroyable_tiles5;
        global.showcollisionarray[i++] = obj_eventtrigger;
        global.showcollisionarray[i++] = obj_doortrigger_parent;
        global.showcollisionarray[i++] = obj_doorS;
        global.showcollisionarray[i++] = obj_doorA;
        global.showcollisionarray[i++] = obj_doorB;
        global.showcollisionarray[i++] = obj_doorC;
        global.showcollisionarray[i++] = obj_doorD;
        global.showcollisionarray[i++] = obj_doorE;
        global.showcollisionarray[i++] = obj_doorP;
        global.showcollisionarray[i++] = obj_cottonsolid;
        global.showcollisionarray[i++] = obj_tiledestroy;
    }
    
    var array = global.showcollisionarray;
    var length = array_length(array);
    var i = length - 1;
    
    while (i >= 0)
    {
        with (array[i])
        {
            if (object_index == array[i])
            {
                visible = global.showcollisions;
                
                if (object_index != obj_solid && object_index != obj_slope)
                    image_alpha = 0.6;
            }
        }
        
        i--;
    }
}

function sh_toggle_debugmode()
{
    var arg1 = argument0[1];
    
    switch (arg1)
    {
        case "true":
        case "1":
            arg1 = true;
            break;
        
        case "false":
        case "0":
            arg1 = false;
            break;
        
        default:
            arg1 = !global.debugmode;
            break;
    }
    
    global.debugmode = arg1;
}

function meta_toggle_debugmode()
{
    return 
    {
        description: "toggles debugmode",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["toggles debugmode"]
    };
}

function sh_room_goto()
{
    var arg1 = asset_get_index(argument0[1]);
    var arg2 = argument0[2];
    
    if (asset_get_type(argument0[1]) != 3)
        return "Can't find room " + string(argument0[1]);
    
    if (asset_get_type(argument0[1]) == 3)
    {
        obj_player.targetRoom = arg1;
        obj_player.targetDoor = arg2;
        instance_create(0, 0, obj_fadeout);
    }
}

function meta_room_goto()
{
    return 
    {
        description: "allows you to go to another room",
        arguments: ["<room>", "<door>"],
        suggestions: [global.roomlist, ["N/A", "A", "B", "C", "D", "E", "P", "S"]],
        argumentDescriptions: ["sets targetRoom", "sets targetDoor"]
    };
}

function sh_instance_create()
{
    var arg1 = argument0[1];
    var arg2 = argument0[2];
    
    switch (arg1)
    {
        case "mouse_x":
            arg1 = mouse_x;
            break;
        
        case "obj_player.x":
            arg1 = obj_player.x;
            break;
    }
    
    switch (arg2)
    {
        case "mouse_y":
            arg2 = mouse_y;
            break;
        
        case "obj_player.y":
            arg2 = obj_player.y;
            break;
    }
    
    instance_create(arg1, arg2, asset_get_index(argument0[3]));
}

function meta_instance_create()
{
    return 
    {
        description: "create an object",
        arguments: ["<x>", "<y>", "<object>"],
        suggestions: [["mouse_x", "obj_player.x"], ["mouse_y", "obj_player.y"], global.objectlist],
        argumentDescriptions: ["the X coordinate to create the object at", "the Y coordinate to create the object at", "the object to create"]
    };
}

function sh_rank()
{
    var arg1 = argument0[1];
    
    switch (arg1)
    {
        case "d":
            if (global.collect >= global.crank)
                global.collect = global.crank - 1;
            
            break;
        
        case "c":
            if (global.collect >= global.brank)
                global.collect = global.brank - 1;
            else
                global.collect = global.crank;
            
            break;
        
        case "b":
            if (global.collect >= global.arank)
                global.collect = global.arank - 1;
            else
                global.collect = global.brank;
            
            break;
        
        case "a":
            if (global.collect >= global.srank)
                global.collect = global.srank - 1;
            else
                global.collect = global.arank;
            
            break;
        
        case "s":
            if (global.collect <= global.srank)
                global.collect = global.srank;
            
            global.combodropped = 1;
            break;
        
        case "p":
            if (global.collect <= global.srank)
                global.collect = global.srank;
            
            global.combodropped = 0;
            global.secretfound = 3;
            
            if (global.lapcount < 1)
                global.lapcount = 1;
            
            global.treasure = 1;
            break;
    }
}

function meta_rank()
{
    return 
    {
        description: "set rank",
        arguments: ["<bool>"],
        suggestions: [["d", "c", "b", "a", "s", "p"]],
        argumentDescriptions: ["set rank"]
    };
}

function sh_donut()
{
    var arg1 = argument0[1];
    
    switch (arg1)
    {
        case "true":
        case "1":
            arg1 = true;
            break;
        
        case "false":
        case "0":
            arg1 = false;
            break;
        
        default:
            arg1 = !global.treat;
            break;
    }
    
    global.treat = arg1;
}

function meta_donut()
{
    return 
    {
        description: "give you a donut",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["add/remove donut"]
    };
}

function sh_noclip()
{
    with (obj_player)
    {
        if (state != states.backbreaker)
        {
            tauntstoredmovespeed = movespeed;
            
            if (state == states.climbwall)
                tauntstoredmovespeed = wallspeed;
            
            tauntstoredsprite = sprite_index;
            tauntstoredstate = state;
            tauntstoredvsp = vsp;
        }
        
        state = states.noclip;
        movespeed = 0;
        hsp = 0;
        vsp = 0;
        wallspeed = 0;
    }
}

function meta_noclip()
{
    return 
    {
        description: "sets noclip",
        arguments: [""],
        suggestions: [[]],
        argumentDescriptions: ["fly through collisions"]
    };
}

function sh_berlingiz0_spr()
{
    var arg1 = asset_get_index(argument0[1]);
    
    if (sprite_exists(arg1))
    {
        global.sigmasprite = sprite_duplicate(arg1);
        
        if (arg1 == spr_minecart || arg1 == spr_minecartend || arg1 == spr_minecartdebris)
            obj_player.ischaracter = "minecart";
        else if (arg1 == spr_chuck)
            obj_player.ischaracter = "chuck";
        else
            obj_player.ischaracter = "normal";
    }
    
    var arg2 = argument0[2];
    var arg3 = argument0[3];
    var arg4 = argument0[4];
    
    if (sprite_exists(arg1))
        obj_player.spr_sigma = global.sigmasprite;
    else
        obj_player.spr_sigma = -4;
    
    switch (arg2)
    {
        case "true":
        case "1":
            arg2 = true;
            break;
        
        default:
            arg2 = false;
            break;
    }
    
    if (global.realsigma && sprite_exists(arg1))
    {
        if (arg2)
            obj_player.mask_index = global.sigmasprite;
        else
            obj_player.mask_index = spr_player_mask;
        
        switch (arg3)
        {
            case "xoffset":
            case "":
            case " ":
                arg3 = sprite_get_xoffset(global.sigmasprite);
                break;
            
            case "centered":
                arg3 = sprite_get_width(global.sigmasprite) / 2;
                break;
        }
        
        switch (arg4)
        {
            case "yoffset":
            case "":
            case " ":
                arg4 = sprite_get_yoffset(global.sigmasprite);
                break;
            
            case "centered":
                arg4 = sprite_get_height(global.sigmasprite) / 2;
                break;
        }
        
        with (obj_player)
            sprite_set_offset(global.sigmasprite, arg3, arg4);
    }
    
    instance_create_depth(obj_player.x, obj_player.y, -8, obj_poofeffect);
}

function meta_berlingiz0_spr()
{
    return 
    {
        description: "berlingiz0 mode sprite",
        arguments: ["<bool>", "<bool>", "<bool>", "<bool>"],
        suggestions: [global.spritelist, ["true", "false"], ["xoffset", "centered"], ["yoffset", "centered"]],
        argumentDescriptions: ["sets berlingiz0 mode sprite", "sets mask index as sprite", "sets sprite xoffset", "sets sprite yoffset"]
    };
}

function sh_playerstate()
{
    var arg1 = argument0[1];
    
    if (instance_exists(obj_player))
    {
        if (is_string(arg1))
        {
            var yeah = arg1;
            arg1 = array_get_index(obj_player.state_arr, yeah);
        }
        
        obj_player.state = real(arg1);
        trace("Player states set to: " + string(obj_player.state));
    }
}

function meta_playerstate()
{
    return 
    {
        description: "state",
        arguments: ["<bool>"],
        suggestions: [obj_player.state_arr],
        argumentDescriptions: ["sets player sprite"]
    };
}

function sh_lap()
{
    global.panic = 1;
    global.minutes = 2;
    global.seconds = 0;
    global.wave = 0;
    global.maxwave = ((global.minutes * 60) + global.seconds) * 60;
    obj_camera.alarm[1] = 60;
    
    if (!instance_exists(obj_panicchanger))
        instance_create(x, y, obj_panicchanger);
    
    var arg1 = real(string_digits(argument0[1])) - 2;
    var b = global.lapcount;
    global.lapcount = arg1;
    var collect = ((b - global.lapcount) * 3000) - 3000;
    global.collect += abs(collect);
    var _room = room;
    
    switch (global.levelname)
    {
        case "entryway":
            _room = entryway_11;
            
            if (global.layout)
                _room = entrywaynew_11;
            
            break;
        
        case "steamy":
            _room = steamy_12;
            
            if (global.layout)
                _room = steamynew_12;
            
            break;
        
        case "molasses":
            _room = molasses_9;
            break;
        
        case "mines":
            _room = mines_12;
            break;
    }
    
    obj_player.hsp = 0;
    
    with (instance_create(obj_player.x, obj_player.y, obj_lapportal))
    {
        targetRoom = _room;
        image_xscale = -obj_player.xscale;
    }
}

function meta_lap()
{
    return 
    {
        description: "sets lap",
        arguments: ["<bool>"],
        suggestions: [],
        argumentDescriptions: ["sets lap count"]
    };
}
