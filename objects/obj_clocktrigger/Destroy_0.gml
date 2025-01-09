if (global.clockdestroy == 0)
{
    with (obj_camera)
    {
        shake_mag = 20;
        shake_mag_acc = 40 / room_speed;
    }
    
    scr_sound(sound_metaldestroy);
    
    repeat (9)
    {
        with (instance_create(x, y, obj_debris))
        {
            sprite_index = spr_cottontower_debris;
            image_index = random_range(0, 4);
            vsp = random_range(-4, -7);
        }
    }
    
    with (obj_player)
    {
        state = states.mach3;
        
        if (movespeed < 12)
            movespeed = 12;
        
        if (character == "N")
            sprite_index = spr_pizzano_mach3hit;
        else
            sprite_index = spr_playerPZ_mach3hit;
        
        image_index = 0;
    }
    
    global.clockdestroy = 1;
}
