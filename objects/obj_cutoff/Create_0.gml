big = 0;
image_speed = 0;
image_index = choose(0, 1, 3);
depth = 0;

if (big)
    sprite_index = spr_cutoffbig;

test = 0;

for (var i = 0; i < 32; i++)
{
    if (place_meeting(x + i, y, obj_tiledestroy))
    {
        with (instance_place(x + i, y, obj_tiledestroy))
            active = true;
        
        break;
    }
    
    if (place_meeting(x + i, y + i, obj_tiledestroy))
    {
        with (instance_place(x + i, y + i, obj_tiledestroy))
            active = true;
        
        break;
    }
    
    if (place_meeting(x - i, y, obj_tiledestroy))
    {
        with (instance_place(x - i, y, obj_tiledestroy))
            active = true;
        
        break;
    }
    
    if (place_meeting(x - i, y - i, obj_tiledestroy))
    {
        with (instance_place(x + i, y + i, obj_tiledestroy))
            active = true;
        
        break;
    }
    
    if (place_meeting(x, y, obj_tiledestroy))
    {
        with (instance_place(x, y, obj_tiledestroy))
            active = true;
        
        break;
    }
}

if (!place_meeting(x, y, obj_solid) && !test)
    instance_destroy();
