function draw_background_tiled(argument0, argument1, argument2)
{
    if (!global.panic)
        draw_sprite_tiled(argument0, 0, argument1, argument2);
    
    if (global.panic)
    {
    }
}
