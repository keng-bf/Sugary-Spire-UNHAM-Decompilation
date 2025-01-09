with (obj_player)
{
    if (hsp > 0 && x > (room_width + 64))
        x = -64;
    
    if (hsp < 0 && x < -64)
        x = room_width + 64;
    
    if (vsp > 0 && y > (room_height + 64))
        y = -64;
    
    if (vsp < 0 && y < -64)
        y = room_height + 64;
    
    if (place_meeting(x, y, other) && grounded && vsp > 0 && other.grounded && other.vsp > 0 && key_up2)
    {
        with (other)
        {
            setting = !setting;
            vsp = -3;
            instance_create(x + 32, y + 32, obj_jumpdust);
            var lay_id = layer_get_id("Tiles_2");
            var lay_id2 = layer_get_id("Tiles_2B");
            scr_sound(sound_step);
            
            if (instance_exists(obj_platform))
            {
                if (obj_platform.image_yscale == 1)
                {
                    obj_platform.y += 32;
                    layer_set_visible(lay_id, false);
                    layer_set_visible(lay_id2, true);
                }
                else if (obj_platform.image_yscale == -1)
                {
                    obj_platform.y -= 32;
                    layer_set_visible(lay_id, true);
                    layer_set_visible(lay_id2, false);
                }
                
                obj_platform.image_yscale *= -1;
            }
        }
    }
}

angle = scr_warp(angle, 0, 270);
scr_collide();
