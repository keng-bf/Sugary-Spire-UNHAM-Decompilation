function scr_player_uppercut()
{
    static attack_afterimagetimer = 6;
    
    image_speed = 0.35;
    
    if (sprite_index == spr_player_uppercutbegin && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_player_uppercutend;
        image_index = 0;
    }
    
    if (sprite_index == spr_pizzano_uppercutbegin && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_pizzano_uppercutend;
        image_index = 0;
    }
    
    if (scr_solid(x + sign(hsp), y) && !scr_slope_ext(x + xscale, y) && move != 0)
        movespeed = 0;
    
    move = key_left + key_right;
    hsp = movespeed;
    var _speed = 6;
    
    if (greenmovespeed > 6 && global.green && move != 0)
        _speed = greenmovespeed;
    
    if (global.green && (move == -sign(movespeed) || move == 0 || scr_solid(x + sign(hsp), y)))
        greenmovespeed = 6;
    
    if (move != 0)
        movespeed = approach(movespeed, move * _speed, 0.5);
    else
        movespeed = approach(movespeed, 0, 0.5);
    
    if (!instance_exists(obj_dashcloud) && grounded)
    {
        with (instance_create_depth(x, y, 0, obj_dashcloud))
            image_xscale = other.xscale;
    }
    
    if (grounded && vsp > 0)
    {
        if (abs(movespeed) < 8 || !key_attack)
        {
            if (move != 0)
                xscale = move;
            
            movespeed = abs(hsp);
            scr_sound(sound_step);
            landAnim = true;
            input_buffer_secondjump = false;
            state = states.normal;
            jumpAnim = true;
            jumpstop = false;
            image_index = 0;
            freefallstart = false;
            instance_create_depth(x, y, 0, obj_landcloud);
        }
        else if (abs(movespeed) >= 8 && abs(movespeed) < 12 && key_attack)
        {
            if (move != 0)
                xscale = move;
            
            movespeed = abs(hsp);
            greenmovespeed = abs(hsp);
            state = states.mach2;
            sprite_index = spr_mach;
            image_index = 0;
            jumpAnim = true;
            jumpstop = false;
        }
        else if (abs(movespeed) >= 12 && key_attack)
        {
            if (move != 0)
                xscale = move;
            
            movespeed = abs(hsp);
            greenmovespeed = abs(hsp);
            state = states.mach3;
            
            if (character == "P")
                sprite_index = spr_player_mach4;
            else
                sprite_index = spr_pizzano_shoulderbash;
            
            image_index = 0;
            jumpAnim = true;
            jumpstop = false;
        }
    }
    
    if (scr_solid(x + sign(hsp), y))
        movespeed = 0;
    
    if (global.green && key_down && vsp < 20)
        vsp += 0.5;
}
