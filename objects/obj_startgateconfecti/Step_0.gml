if (obj_player.state == states.backbreaker && state != states.hookshot && obj_player.sprite_index == obj_player.spr_player_taunt && bbox_in_camera(view_camera[0]))
{
    storedstate = state;
    storedsprite = sprite_index;
    state = states.hookshot;
    instance_create(x, y, obj_confectitaunt);
    sprite_index = tauntspr;
    image_index = irandom(sprite_get_number(tauntspr) - 1);
}

switch (state)
{
    case states.normal:
        sprite_index = runspr;
        hsp = image_xscale * 2;
        
        if (scr_solid(x + sign(hsp), y))
        {
            image_xscale *= -1;
            hsp *= -1;
        }
        else if (!(scr_solid(x + (image_xscale * 32), y + 31) || place_meeting(x + (image_xscale * 32), y + 31, obj_platform)))
        {
            image_xscale *= -1;
            hsp *= -1;
        }
        
        x += hsp;
        break;
    
    case states.titlescreen:
        sprite_index = idlespr;
        hsp = 0;
        break;
    
    case states.hookshot:
        hsp = 0;
        vsp = 0;
        
        if (obj_player.state != states.backbreaker)
        {
            state = storedstate;
            sprite_index = storedsprite;
        }
        
        break;
}

scr_collide();
