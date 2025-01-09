if (state == baddiestates.stun && stunned > 40 && !birdcreated)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
    
    idletimer = 200;
}

if (idletimer > 0)
    idletimer--;
else if (state == baddiestates.punkattack)
    idletimer = 250;

if (state != baddiestates.stun)
    birdcreated = false;

if (flash && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != baddiestates.grabbed)
    depth = 0;

if (state != baddiestates.stun)
    thrown = false;

if (!boundbox && state != baddiestates.inhaled)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index;
        mask_index = other.mask_index;
        baddieID = other.id;
        other.boundbox = true;
    }
}

if (((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 60) && y >= (obj_player.y - 60))) && obj_player.state != states.cottondrill && obj_player.state != states.door && obj_player.state != states.cottonroll && obj_player.state != states.pizzanoshoulderbash)
{
    if (state != baddiestates.thrown && !idletimer)
    {
        if (state == baddiestates.walk || state == baddiestates.idle)
        {
            hsp = 0;
            image_index = 0;
            sprite_index = spr_candycorn_prep;
            state = baddiestates.punkattack;
            
            if (x != obj_player.x)
                image_xscale = -sign(x - obj_player.x);
            
            punkbuffer = 110;
        }
    }
}

if (!hitboxcreate && sprite_index == spr_candycorn_attack && state == baddiestates.punkattack)
{
    hitboxcreate = 1;
    
    with (instance_create(x, y, obj_forkhitbox))
    {
        ID = other.id;
        depth = -1;
    }
}

if (state == baddiestates.stun)
    grav = 0.5;
else
    grav = 0;
