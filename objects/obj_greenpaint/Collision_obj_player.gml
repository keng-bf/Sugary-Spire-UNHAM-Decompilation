if (ds_list_find_index(global.saveroom, id) == -1)
{
    other.paletteselect = 17;
    global.green = true;
    scr_sound(sound_paintsplash);
    ds_list_add(global.saveroom, id);
    sprite_index = spr_greenpaintsplash;
    image_index = 0;
    x = other.x;
    y = other.y + 4;
}
