function scr_enemy_punkattack()
{
    image_speed = 0.35;
    
    if (sprite_index == spr_candycorn_prep && animation_end())
    {
        sprite_index = spr_candycorn_attack;
        hsp = 8 * image_xscale;
    }
    
    if (punkbuffer > 0)
        punkbuffer--;
    
    if (punkbuffer == 0 && animation_end())
    {
        if (sprite_index == spr_candycorn_back && animation_end())
        {
            punkbuffer = 0;
            image_index = 0;
            sprite_index = spr_candycorn;
            hsp = 5 * image_xscale;
            state = baddiestates.walk;
            scr_sound(sound_suplex1);
        }
        else
        {
            punkbuffer = 0;
            hsp = 0;
            image_index = 0;
            sprite_index = spr_candycorn_back;
        }
    }
    
    if (scr_solid(x + image_xscale, y) && !scr_slope_ext(x + image_xscale, y))
    {
        with (instance_create(x, y, obj_explosioneffect))
            sprite_index = spr_bombexplosion;
        
        instance_destroy();
    }
}
