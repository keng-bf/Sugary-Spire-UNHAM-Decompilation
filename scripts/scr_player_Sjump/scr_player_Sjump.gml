function scr_player_Sjump()
{
    if (character == "P" && (sprite_index != spr_player_superspring && sprite_index != spr_player_superspringceiling))
        hsp = move * 2;
    else if (character == "P" && (sprite_index == spr_player_superspring || sprite_index == spr_player_superspringceiling))
        hsp = 0;
    else if (character == "N" && sprite_index == spr_pizzano_sjump)
        hsp = move * 3;
    
    Sjumpcan_doublejump = false;
    mach2 = 0;
    jumpAnim = true;
    dashAnim = true;
    landAnim = false;
    moveAnim = true;
    stopAnim = true;
    crouchslideAnim = true;
    crouchAnim = false;
    machhitAnim = false;
    move = key_left + key_right;
    
    if (sprite_index != spr_pizzano_sjump && sprite_index != spr_player_superspring)
    {
        if (move != 0)
            xscale = move;
    }
    
    if (sprite_index == spr_superjump || sprite_index == spr_player_superspring)
    {
        vsp = -movespeed;
        
        if (instance_exists(obj_warphallway))
            movespeed += 1;
        else
            movespeed = approach(movespeed, 18, 1);
    }
    
    image_speed = 0.5;
    
    if ((input_buffer_attack < 10 || input_buffer_slap < 8) && !grounded && vsp < -10 && character == "P" && sprite_index != spr_playerPZ_Sjumpcancelstart && sprite_index != spr_player_superspring)
    {
        input_buffer_slap = 8;
        input_buffer_attack = 10;
        sprite_index = spr_playerPZ_Sjumpcancelstart;
        image_index = 0;
        scr_sound(superjumpcancel);
        greenmovespeed = movespeed;
    }
    
    if (scr_solid(x, y + vsp) && !place_meeting(x, y + vsp, obj_boxofpizza) && !place_meeting(x, y + vsp, obj_metalblock) && !place_meeting(x, y + vsp, obj_destructibles) && sprite_index != spr_playerPZ_Sjumpcancelstart && sprite_index != spr_playerPZ_Sjumpcancel && ((!key_slap2 && !key_attack2 && sprite_index != spr_player_superspring) || sprite_index == spr_player_superspring) && !place_meeting(x, y - 1, obj_vertical_hallway) && !place_meeting(x, y + vsp, obj_vertical_hallway) && !place_meeting(x, y + vsp, obj_vertical_hallway))
    {
        scr_sound(sound_maximumspeedland);
        
        if (sprite_index == spr_player_superspring)
            sprite_index = spr_player_superspringceiling;
        else
            sprite_index = spr_superjumpland;
        
        with (obj_camera)
        {
            shake_mag = 10;
            shake_mag_acc = 30 / room_speed;
        }
        
        with (obj_baddie)
        {
            if (point_in_camera(x, y, view_camera[0]) && grounded)
            {
                image_index = 0;
                state = baddiestates.idle;
                vsp = -7;
                hsp = 0;
            }
        }
        
        image_index = 0;
        state = states.Sjumpland;
        machhitAnim = false;
        movespeed = 0;
    }
    
    if (sprite_index == spr_playerPZ_Sjumpcancelstart)
    {
        hsp = 0;
        vsp = 0;
        
        if (move != 0)
            xscale = move;
        
        if (floor(image_index) == (image_number - 1))
        {
            movespeed = 15;
            machhitAnim = 0;
            state = states.mach3;
            flash = 1;
            vsp = -5;
            image_index = 0;
            sprite_index = spr_playerPZ_Sjumpcancel;
            
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale;
            
            if (global.green && greenmovespeed > 15)
                movespeed = greenmovespeed;
        }
    }
    
    if ((input_buffer_attack < 10 || input_buffer_slap < 8) && !grounded && vsp < -10 && character == "N")
    {
        greenmovespeed = movespeed;
        input_buffer_slap = 8;
        input_buffer_attack = 10;
        flash = true;
        charged = false;
        sprite_index = spr_pizzano_spincancel;
        image_index = 0;
        movespeed = 12;
        
        if (global.green && greenmovespeed > 12)
            movespeed = greenmovespeed;
        
        if (vsp > -5)
            vsp = -5;
        
        mach2 = 0;
        state = states.mach2;
        
        with (instance_create(x, y, obj_crazyrunothereffect))
            image_xscale = other.xscale;
        
        scr_sound(sound_suplex1);
        instance_create(x, y, obj_jumpdust);
        
        if (move != 0)
            xscale = move;
    }
    
    scr_collide_player();
    
    if (!instance_exists(obj_chargeeffectsjump) && sprite_index != spr_playerPZ_Sjumpcancelstart && sprite_index != spr_playerPZ_Sjumpcancel)
        instance_create(x, y - 16, obj_chargeeffectsjump);
}
