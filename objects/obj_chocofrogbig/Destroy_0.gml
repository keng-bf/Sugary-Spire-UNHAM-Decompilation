if (ds_list_find_index(global.saveroom, id) == -1)
{
    instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_poofeffect);
    instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_parryeffect);
    
    with (instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_sausageman_dead))
        sprite_index = other.deadSpr;
    
    if (object_index == obj_chocofrogsmall)
        scr_sound(froghurt1, froghurt2, froghurt3);
    else
        scr_sound(frogdeath1, frogdeath2, frogdeath3);
    
    ds_list_add(global.saveroom, id);
    
    switch (global.combo)
    {
        case 0:
        case 1:
            scr_sound(sound_combo1);
            break;
        
        case 2:
            scr_sound(sound_combo2);
            break;
        
        case 3:
            scr_sound(sound_combo3);
            break;
        
        default:
            scr_sound(sound_combo4);
            break;
    }
    
    global.combo++;
    create_small_number(x, y, string(10 + floor(global.combo * 0.5)));
    var combototal = 10 + floor(global.combo * 0.5);
    global.collect += combototal;
    global.comboscore += combototal;
    global.combotime = 60;
    global.style += 4;
    global.combofreeze = 30;
    obj_player.supercharge++;
}
