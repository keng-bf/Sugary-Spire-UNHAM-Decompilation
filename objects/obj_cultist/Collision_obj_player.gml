var _transfo = false;
var _state = other.state;

with (other)
{
    if (state == states.cotton || state == states.cottondrill || state == states.cottonroll)
    {
        if (hsp != 0)
            xscale = sign(hsp);
        
        movespeed = abs(hsp);
        state = states.normal;
        sprite_index = spr_idle;
        dir = xscale;
        _transfo = true;
        instance_create(x, y, obj_poofeffect);
    }
}

if (_transfo)
{
    scr_sound(sfx_cultist);
    scr_sound(sfx_pray);
    var p = other.id;
    
    with (instance_create(other.x - 540, camera_get_view_y(view_camera[0]) - 100, obj_cultistdemon))
    {
        priestID = other.id;
        playerid = p;
    }
    
    sprite_index = spr_cultist_pray;
    
    if (collect && ds_list_find_index(global.saveroom, id) == -1)
    {
        global.combotime = 60;
        ds_list_add(global.saveroom, id);
        var val = 500;
        global.collect += val;
        global.combotime = 60;
        
        with (instance_create(x + 16, y, obj_smallnumber))
            number = string(val);
        
        repeat (2)
            scr_sound(sound_points);
        
        if (escape)
            ds_list_add(global.escaperoom, id);
        
        var d = round(val / 16);
        
        for (var i = 0; i < val; i += d)
        {
            with (instance_create(other.x + irandom_range(-60, 60), other.y + irandom_range(-60, obj_secretwall), obj_collecteffect))
                pal_index = irandom_range(1, sprite_get_width(spr_candy_pal));
        }
    }
}
