if (point_in_circle(x, y, obj_player.x + (75 * obj_player.xscale), obj_player.y, 125) && obj_player.inhaling && state != states.knightpepslopes)
    state = baddiestates.inhaled;

if (state == baddiestates.stun && stunned > 40 && !birdcreated)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != baddiestates.stun)
    birdcreated = false;

if (bombreset > 0)
    bombreset--;

if (state == baddiestates.witchattack)
{
    if (waitbuffer > 0)
        waitbuffer--;
}
else
{
    waitbuffer = 10;
}

if ((((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 60) && y >= (obj_player.y - 60))) && obj_player.state != states.cotton && obj_player.state != states.cottondrill && obj_player.state != states.door && obj_player.state != states.cottonroll && obj_player.state != states.pizzanoshoulderbash) && global.layout == 0)
{
    if (state != baddiestates.thrown && !bombreset && obj_player.state != states.cotton)
    {
        if (state == baddiestates.walk || state == baddiestates.idle)
        {
            image_index = 0;
            state = baddiestates.thrown;
            
            if (x != obj_player.x)
                image_xscale = -sign(x - obj_player.x);
            
            sprite_index = spr_throw;
        }
    }
}

if ((((obj_player.x > (x - 200) && obj_player.x < (x + 200)) && (y <= (obj_player.y + 60) && y >= (obj_player.y - 60))) && obj_player.state != states.cotton && obj_player.state != states.cottondrill && obj_player.state != states.door && obj_player.state != states.cottonroll && obj_player.state != states.pizzanoshoulderbash && obj_player.state != states.mach3 && obj_player.sprite_index != spr_playerPZ_machslideboost3 && obj_player.sprite_index != spr_playerPZ_machslideboost3fall && obj_player.sprite_index != spr_pizzano_mach3boost && obj_player.sprite_index != spr_pizzano_mach3boostfall && obj_player.state != states.Sjump) && global.layout == 1)
{
    if ((state != baddiestates.thrown && state != baddiestates.scared && bombreset == 0) && global.layout == 1)
    {
        if (state == baddiestates.walk || state == baddiestates.idle)
        {
            hsp = 0;
            image_index = 0;
            state = baddiestates.witchattack;
            
            if (x != obj_player.x)
                image_xscale = -sign(x - obj_player.x);
            
            sprite_index = spr_cottonwitch_attack;
            bombreset = 180;
        }
    }
}

if (!hitboxcreate && waitbuffer == 0 && state == baddiestates.witchattack)
{
    hitboxcreate = 1;
    
    with (instance_create(x, y, obj_cottonwitch_attackhitbox))
    {
        ID = other.id;
        depth = -1;
    }
    
    scr_sound(sfx_electricity);
}

if (flash && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (flash && alarm[4] <= 0)
    alarm[4] = 0.15 * room_speed;

if (state != baddiestates.grabbed)
    depth = 0;

if (state != baddiestates.stun)
    thrown = false;

if (!boundbox && state != baddiestates.inhaled && sprite_index != spr_cottonwitch_scarednew2)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index;
        mask_index = other.mask_index;
        baddieID = other.id;
        other.boundbox = true;
    }
}

scr_scareenemy();
