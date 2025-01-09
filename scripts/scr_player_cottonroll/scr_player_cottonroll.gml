function scr_player_cottonroll()
{
    static cotton_afterimagetimer = 6;
    
    if (movespeed >= 10)
        sprite_index = spr_cottonmaxroll;
    else
        sprite_index = spr_cottonroll;
    
    hsp = xscale * movespeed;
    dir = xscale;
    momemtum = true;
    
    if (place_meeting(x, y, obj_cottonsolid))
    {
        if (move == 0 && !key_down && !key_up && (sprite_index == spr_cottonfall || sprite_index == spr_cottondoublefall))
            vsp = 2;
        
        if (key_attack)
            vsp = approach(vsp, (key_down - key_up) * 10, 1);
        else
            vsp = approach(vsp, (key_down - key_up) * 8, 1);
        
        if (vsp > 0 && sprite_index != spr_cottondrill && sprite_index != spr_cottonattack && sprite_index != spr_cottondoublefall && sprite_index != spr_cottonPizzano_fastfall && !grounded)
            sprite_index = spr_cottonfall;
        
        if (vsp < 0 && (sprite_index == spr_cottonfall || sprite_index == spr_cottondoublefall) && key_up)
        {
            image_index = 0;
            sprite_index = spr_cottondoublejump;
            scr_sound(sfx_cottonjump);
        }
        
        groundedcot = 1;
        jumpcot = 1;
    }
    
    if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_chocofrogbig))
    {
        xscale *= -1;
        movespeed--;
        
        if (movespeed < 8)
            movespeed = 8;
        
        instance_create(x, y, obj_bangeffect);
    }
    
    if (movespeed < 3)
        movespeed = 3;
    
    if (grounded && !key_down && movespeed < 9 && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
    {
        state = states.cotton;
        sprite_index = spr_cottonidle;
        momemtum = true;
    }
    
    if (input_buffer_jump < 8 && !grounded)
    {
        momemtum = true;
        state = states.cotton;
        vsp = -10;
        grav = 0.1;
        image_index = 0;
        sprite_index = spr_cottondoublejump;
        
        with (instance_create(x, y, obj_highjumpcloud2))
        {
            image_xscale = other.xscale;
            
            if (other.character == "N")
                sprite_index = spr_pizzano_cottonpoof;
            else
                sprite_index = spr_cottonpoof;
        }
        
        scr_sound(sound_jump);
        input_buffer_jump = 8;
        cottonrollgetup = 1;
    }
    
    if (input_buffer_jump < 8 && grounded && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
    {
        momemtum = true;
        state = states.cotton;
        vsp = -14;
        grav = 0.025;
        image_index = 0;
        sprite_index = spr_cottonpljump;
        instance_create(x, y, obj_highjumpcloud2);
        scr_sound(sound_jump);
        input_buffer_jump = 8;
    }
    
    dir = xscale;
    
    if (grounded && vsp > 0)
    {
        if (scr_slope() && hsp != 0 && movespeed < 20)
            scr_player_addslopemomentum(0.1, 0.2);
    }
    
    image_speed = 0.35 + ((movespeed / 12) * 0.35);
    
    if (cotton_afterimagetimer > 0)
        cotton_afterimagetimer--;
    
    if (cotton_afterimagetimer <= 0)
    {
        with (instance_create(x, y, obj_cotton_aftereffect))
            playerid = other.id;
        
        cotton_afterimagetimer = 6;
    }
}
