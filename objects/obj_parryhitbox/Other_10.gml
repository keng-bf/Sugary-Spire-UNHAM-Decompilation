instance_destroy();

if (!audio_is_playing(sound_parry))
    scr_sound(sound_parry);

with (playerID)
{
    state = states.parry;
    
    if (character == "P")
        sprite_index = choose(spr_player_parry1, spr_player_parry2, spr_player_parry3);
    else if (character == "N")
        sprite_index = spr_pizzano_parry1;
    
    image_index = 0;
    movespeed = -8;
    flash = true;
    
    with (instance_create(x, y, obj_parryeffect))
        image_xscale = other.xscale;
}
