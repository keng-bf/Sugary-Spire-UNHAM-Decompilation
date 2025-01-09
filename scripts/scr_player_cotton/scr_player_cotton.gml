function scr_player_cotton()
{
    static cotton_afterimagetimer = 6;
    
    if (sprite_index == spr_cottontransfo)
    {
        hsp = 0;
        
        if (animation_end())
        {
            xscale *= -1;
            sprite_index = spr_cottonland;
            
            with (obj_cottoncreator)
                visible = true;
            
            if (global.layout && character == "P")
                scr_tip("cottonnew");
            else if (global.layout && character == "N")
                scr_tip("cotton2");
            else
                scr_tip("cotton");
            
            image_speed = 0.35;
        }
    }
    
    if (sprite_index != spr_cottontransfo)
    {
        if (sprite_index != spr_cottonPizzano_wallclimb)
        {
            if (sprite_index != spr_cottonPizzano_jumpwall && sprite_index != spr_cottonPizzano_fall && sprite_index != spr_cottonPizzano_fastfall && sprite_index != spr_cottonPizzano_drillup && sprite_index != spr_cotton_drillup)
            {
                if (dir != xscale)
                {
                    dir = xscale;
                    movespeed = 0;
                    cottonrollgetup = 0;
                }
            }
            
            if (sprite_index != spr_cotton_slam && sprite_index != spr_cotton_slam2 && sprite_index != spr_cotton_slam3 && sprite_index != spr_cottonPizzano_wallclimb)
                move = key_left + key_right;
            
            if (sprite_index != spr_cottonattack)
            {
                if (move != 0)
                    xscale = move;
            }
            
            hsp = move * movespeed;
            
            if (move != 0 || cottonrollgetup)
            {
                if (movespeed < 8)
                    movespeed += 0.5;
            }
            else if (place_meeting(x, y, obj_cottonsolid) && move == 0)
            {
                movespeed = approach(movespeed, 0, 0.2);
            }
            else if (!place_meeting(x, y, obj_cottonsolid) && move == 0 && !cottonrollgetup)
            {
                movespeed = 0;
            }
            else if (!place_meeting(x, y, obj_cottonsolid) && move == 0 && cottonrollgetup)
            {
                movespeed = approach(movespeed, 0, 0.2);
            }
            
            if (!place_meeting(x, y, obj_cottonsolid) && sprite_index != spr_cottonPizzano_fastfall)
            {
                if (vsp > 5)
                    vsp = 5;
            }
            
            if (place_meeting(x, y, obj_cottonsolid))
            {
                if (!instance_exists(obj_transfotip))
                    scr_tip("cottonsolid");
                
                if (move == 0 && !key_down && !key_up && (sprite_index == spr_cottonfall || sprite_index == spr_cottondoublefall))
                    vsp = 2;
                
                if (movespeed > 7)
                    movespeed -= 0.5;
                
                if ((sprite_index != spr_cottonPizzano_drillup && sprite_index != spr_cotton_drillup) || ((sprite_index == spr_cottonPizzano_drillup && !key_jump2) || (sprite_index == spr_cotton_drillup && !key_slap)))
                {
                    if (key_attack)
                        vsp = approach(vsp, (key_down - key_up) * 10, 1);
                    else
                        vsp = approach(vsp, (key_down - key_up) * 8, 1);
                }
                
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
                incotton = 1;
                cottonuppercut = 0;
                
                if (input_buffer_cottondown < 10 && key_down2 && character == "P")
                {
                    vsp = 9;
                    state = states.cottondrill;
                    sprite_index = spr_cottondrill;
                    image_index = 0;
                    scr_sound(sound_suplex1);
                    flash = true;
                    drill = false;
                    
                    with (instance_create(x, y, obj_afterimageoutward))
                        hspeed = 7;
                    
                    with (instance_create(x, y, obj_afterimageoutward))
                        hspeed = -7;
                    
                    with (instance_create(x, y, obj_afterimageoutward))
                        vspeed = 7;
                    
                    with (instance_create(x, y, obj_afterimageoutward))
                        vspeed = -7;
                    
                    input_buffer_cottondown = 10;
                    key_down2 = 0;
                }
            }
            
            if (input_buffer_jump < 8 && grounded && !key_down && vsp > 0)
            {
                vsp = -14;
                grav = 0.025;
                image_index = 0;
                sprite_index = spr_cottonpljump;
                instance_create(x, y, obj_highjumpcloud2);
                scr_sound(sfx_cottonjump);
                input_buffer_jump = 8;
            }
            
            if (input_buffer_slap < 8 && sprite_index != spr_cottonattack && (((!global.layout || ((!key_up || cottonuppercut) && global.layout)) && character == "P") || (character == "N" && ((!key_down && global.layout) || !global.layout))) && (groundedcot || place_meeting(x, y, obj_cottonsolid)))
            {
                flash = true;
                image_index = 0;
                sprite_index = spr_cottonattack;
                
                if (!grounded && !place_meeting(x, y, obj_cottonsolid))
                    vsp = -5;
                
                if (global.layout == 0)
                    grav = 0.2;
                else
                    grav = 0.00001;
                
                audio_stop_sound(sfx_cottonattack);
                scr_sound(sfx_cottonattack);
                
                if (!place_meeting(x, y, obj_cottonsolid))
                    groundedcot = false;
                
                input_buffer_slap = 8;
            }
            
            if (sprite_index == spr_cottonattack)
            {
                if (global.layout == 1)
                    hsp = 12 * xscale;
                else
                    hsp = 10 * xscale;
                
                instance_create(x, y, obj_swordhitbox);
                move = xscale;
                
                if ((-key_left2 && xscale == 1) || (key_right2 && xscale == -1))
                {
                    movespeed = 0;
                    cottonrollgetup = 0;
                    vsp = 0;
                    hsp = 0;
                    sprite_index = spr_cottonfall;
                }
                
                if (incotton && !place_meeting(x, y, obj_cottonsolid) && !key_slap && global.layout)
                {
                    sprite_index = spr_cottonfall;
                    
                    if (!grounded)
                        vsp = -7;
                    
                    hsp += (12 * xscale);
                    incotton = 0;
                }
            }
            
            if (sprite_index == spr_cottonattack && animation_end() && ((((!key_slap && place_meeting(x, y, obj_cottonsolid)) || !place_meeting(x, y, obj_cottonsolid)) && global.layout) || !global.layout))
            {
                if (grounded)
                {
                    image_index = 0;
                    sprite_index = spr_cottonland;
                    
                    if (move != 0)
                        sprite_index = spr_cottonland2;
                }
                else
                {
                    image_index = 0;
                    sprite_index = spr_cottonfall;
                }
            }
            
            if (sprite_index == spr_cottonidle && move != 0)
            {
                image_index = 0;
                sprite_index = spr_cottonwalk;
            }
            
            if (sprite_index == spr_cottonwalk && move == 0)
            {
                image_index = 0;
                sprite_index = spr_cottonidle;
            }
            
            if ((sprite_index == spr_cottonpljump || (sprite_index == spr_cottonPizzano_drillup && ((((!key_jump2 && place_meeting(x, y, obj_cottonsolid)) || !place_meeting(x, y, obj_cottonsolid)) && global.layout) || !global.layout)) || sprite_index == spr_cottonPizzano_jumpwall || (sprite_index == spr_cotton_drillup && ((((!key_slap && place_meeting(x, y, obj_cottonsolid)) || !place_meeting(x, y, obj_cottonsolid)) && global.layout) || !global.layout))) && animation_end())
            {
                image_index = 0;
                
                if (sprite_index == spr_cottonPizzano_drillup || sprite_index == spr_cotton_drillup)
                {
                    if (input_buffer_slap < 8 && ((!key_down && character == "N" && global.layout) || character == "P"))
                    {
                        state = states.cotton;
                        flash = true;
                        image_index = 0;
                        sprite_index = spr_cottonattack;
                        grounded = false;
                        vsp = -5;
                        grav = 0.2;
                        scr_sound(sound_suplex1);
                        groundedcot = false;
                        input_buffer_slap = 8;
                    }
                    else
                    {
                        sprite_index = spr_cottonfall;
                    }
                }
                else
                {
                    sprite_index = spr_cottonfall;
                }
            }
            
            if (((sprite_index == spr_cotton_drillup && key_slap) || (key_jump2 && sprite_index == spr_cottonPizzano_drillup)) && place_meeting(x, y, obj_cottonsolid) && vsp > -10)
                vsp = approach(vsp, -10, 1);
            
            if (sprite_index == spr_cotton_drillup || sprite_index == spr_cottonPizzano_drillup)
            {
                if (incotton && !place_meeting(x, y, obj_cottonsolid) && global.layout)
                {
                    sprite_index = spr_cottonfall;
                    
                    if (character == "P")
                        vsp += -4;
                    
                    incotton = 0;
                }
            }
            
            if (sprite_index == spr_cottonPizzano_fastfall && !key_down)
                sprite_index = spr_cottonfall;
            
            if (sprite_index == spr_cottondoublejump && animation_end())
            {
                image_index = 0;
                sprite_index = spr_cottondoublefall;
            }
            
            if ((sprite_index == spr_cottonfall || sprite_index == spr_cottondoublefall || sprite_index == spr_cottonpljump || sprite_index == spr_cottondoublejump || sprite_index == spr_cottonPizzano_fastfall) && grounded && vsp > 0)
            {
                image_index = 0;
                
                if (move != 0)
                    sprite_index = spr_cottonland2;
                else
                    sprite_index = spr_cottonland;
                
                instance_create(x, y, obj_landcloud);
                scr_sound(sound_land);
            }
            
            if (sprite_index == spr_cottonfall && input_buffer_jump < 8 && character == "P" && !key_down)
            {
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
                
                scr_sound(sfx_cottondoublejump);
                input_buffer_jump = 8;
            }
            
            if (input_buffer_jump < 8 && sprite_index == spr_cottonfall && sprite_index != spr_cottonPizzano_drillup && !key_down && !grounded && character == "N")
            {
                if (place_meeting(x, y, obj_cottonsolid))
                    vsp = -18;
                else
                    vsp = -14;
                
                grav = 0.1;
                image_index = 0;
                sprite_index = spr_cottonPizzano_drillup;
                
                with (instance_create(x, y, obj_highjumpcloud2))
                {
                    image_xscale = other.xscale;
                    
                    if (other.character == "N")
                        sprite_index = spr_pizzano_cottonpoof;
                    else
                        sprite_index = spr_cottonpoof;
                }
                
                scr_sound(sfx_cottondoublejump);
                input_buffer_jump = 8;
            }
            
            if (input_buffer_slap < 8 && key_up && sprite_index != spr_cotton_drillup && character == "P" && !key_down && (place_meeting(x, y, obj_cottonsolid) || ((jumpcot && global.layout == 1) && !cottonuppercut)))
            {
                if (place_meeting(x, y, obj_cottonsolid))
                    vsp = -18;
                else
                    vsp = -14;
                
                grav = 0.1;
                image_index = 0;
                sprite_index = spr_cotton_drillup;
                
                with (instance_create(x, y, obj_highjumpcloud2))
                {
                    image_xscale = other.xscale;
                    sprite_index = spr_cottonpoof;
                }
                
                scr_sound(sound_suplex1);
                input_buffer_slap = 8;
                
                if (!place_meeting(x, y, obj_cottonsolid))
                    jumpcot = 0;
                
                with (instance_create(x, y, obj_afterimageoutward))
                    hspeed = 7;
                
                with (instance_create(x, y, obj_afterimageoutward))
                    hspeed = -7;
                
                with (instance_create(x, y, obj_afterimageoutward))
                    vspeed = 7;
                
                with (instance_create(x, y, obj_afterimageoutward))
                    vspeed = -7;
                
                cottonuppercut = 1;
            }
            
            if (sprite_index == spr_cottonland && animation_end())
                sprite_index = spr_cottonidle;
            
            if (sprite_index == spr_cottonland2 && animation_end())
                sprite_index = spr_cottonwalk;
            
            if (key_down && grounded && vsp > 0)
            {
                sprite_index = spr_cottonroll;
                state = states.cottonroll;
                
                if (movespeed < 8)
                    movespeed = 8;
                
                if (move != 0)
                    xscale = move;
                
                cottonuppercut = 0;
            }
            
            if (((key_down2 && !place_meeting(x, y, obj_cottonsolid) && character == "P") || (key_down && input_buffer_slap < 8 && character == "N" && global.layout)) && !grounded && drill && sprite_index != spr_cotton_slam && sprite_index != spr_cotton_slam2 && sprite_index != spr_cotton_slam3 && sprite_index != spr_cottonPizzano_wallclimb)
            {
                vsp = 9;
                state = states.cottondrill;
                sprite_index = spr_cottondrill;
                image_index = 0;
                scr_sound(sound_suplex1);
                flash = true;
                drill = false;
                
                with (instance_create(x, y, obj_afterimageoutward))
                    hspeed = 7;
                
                with (instance_create(x, y, obj_afterimageoutward))
                    hspeed = -7;
                
                with (instance_create(x, y, obj_afterimageoutward))
                    vspeed = 7;
                
                with (instance_create(x, y, obj_afterimageoutward))
                    vspeed = -7;
                
                input_buffer_slap = 8;
            }
            
            if (key_down && !grounded && sprite_index != spr_cotton_slam && sprite_index != spr_cotton_slam2 && sprite_index != spr_cotton_slam3 && sprite_index != spr_cottonPizzano_wallclimb && sprite_index != spr_cottonattack && character == "N")
            {
                vsp = approach(vsp, 11, 1);
                sprite_index = spr_cottonPizzano_fastfall;
                
                if (!instance_exists(obj_transfotip) && global.layout)
                    scr_tip("cottonnew");
            }
            
            if ((scr_solid(x + xscale, y) && !place_meeting(x, y + 1, obj_slope) && !place_meeting(x, y + 1, obj_slopeplatform) && !place_meeting(x + sign(movespeed), y, obj_destructibles) && !place_meeting(x + sign(movespeed), y, obj_bigdestructibles) && !place_meeting(x + sign(movespeed), y, obj_oneway)) && !grounded && sprite_index != spr_cottonattack && sprite_index != spr_cottondrill && sprite_index != spr_cottonPizzano_drillup && sprite_index != spr_cottonPizzano_fastfall && character == "N")
            {
                image_index = 0;
                sprite_index = spr_cottonPizzano_wallclimb;
                
                if (key_up || key_jump2)
                {
                    vsp = -abs(hsp);
                }
                else if (vsp <= 0 && !key_up && !key_jump2)
                {
                    vsp = -abs(hsp);
                }
                else if (vsp > 0 && vsp <= 5 && !key_up)
                {
                }
                else if (vsp > 5)
                {
                    vsp = abs(hsp);
                }
                
                if (move != 0)
                    xscale = move;
            }
            
            if (!grounded && sprite_index != spr_cottonpljump && sprite_index != spr_cottonattack && sprite_index != spr_cottondoublejump && sprite_index != spr_cottondoublefall && sprite_index != spr_cottondrill && sprite_index != spr_cotton_slam && sprite_index != spr_cotton_slam2 && sprite_index != spr_cotton_slam3 && sprite_index != spr_cottonPizzano_drillup && sprite_index != spr_cottonPizzano_wallclimb && sprite_index != spr_cottonPizzano_jumpwall && sprite_index != spr_cottonPizzano_fastfall && sprite_index != spr_cotton_drillup)
                sprite_index = spr_cottonfall;
            
            if (grounded && !drill)
                drill = true;
        }
        else if (sprite_index == spr_cottonPizzano_wallclimb && character == "N")
        {
            vsp = approach(vsp, (key_down - key_up) * 10, 1);
            
            if (!scr_solid(x + (xscale * 16), y) && sprite_index != spr_cottonpljump)
                sprite_index = spr_cottonfall;
            
            if (input_buffer_jump < 8 && ((!key_down && grounded && vsp > 0) || !grounded))
            {
                vsp = -14;
                xscale *= -1;
                var modify = 1;
                
                if (xscale == -1)
                    modify = -1;
                
                movespeed = 11 * modify * xscale;
                grav = 0.1;
                image_index = 0;
                sprite_index = spr_cottonPizzano_jumpwall;
                
                with (instance_create(x, y, obj_highjumpcloud2))
                {
                    image_xscale = other.xscale;
                    
                    if (other.character == "N")
                        sprite_index = spr_pizzano_cottonpoof;
                    else
                        sprite_index = spr_cottonpoof;
                }
                
                scr_sound(sfx_cottondoublejump);
                input_buffer_jump = 8;
            }
            
            if (grounded)
            {
                image_index = 0;
                sprite_index = spr_cottonland;
                
                if (move != 0)
                    sprite_index = spr_cottonland2;
                
                movespeed = 0;
                cottonrollgetup = 0;
                
                if (key_down && (place_meeting(x, y + 1, obj_slope) || place_meeting(x, y + 1, obj_slopeplatform)))
                {
                    sprite_index = spr_cottonroll;
                    state = states.cottonroll;
                    movespeed = 8;
                    
                    if (move != 0)
                        xscale = move;
                }
            }
        }
        
        if (sprite_index == spr_cottonwalk)
        {
            image_speed = ((movespeed / 8) * 0.15) + 0.35;
        }
        else if (sprite_index == spr_cottonPizzano_wallclimb)
        {
            image_speed = (-vsp / 8) * 0.5;
            
            if ((grounded && vsp > 0) || (!grounded && scr_solid(x, y - 1) && vsp < 0))
                image_speed = 0;
        }
        else
        {
            image_speed = 0.35;
        }
        
        if (cotton_afterimagetimer > 0)
            cotton_afterimagetimer--;
        
        if (cotton_afterimagetimer <= 0)
        {
            with (instance_create(x, y, obj_cotton_aftereffect))
                playerid = other.id;
            
            cotton_afterimagetimer = 6;
        }
    }
    
    if (grounded && vsp > 0)
    {
        cottonuppercut = 0;
        cottonrollgetup = 0;
    }
}
