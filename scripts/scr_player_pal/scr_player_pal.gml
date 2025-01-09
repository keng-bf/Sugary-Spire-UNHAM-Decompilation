function scr_player_pal()
{
    move = key_left2 + key_right2;
    move2 = key_up2 - key_down2;
    
    if (move != 0)
    {
        switch (character)
        {
            default:
                paletteselect = wrap(paletteselect + move, 1, sprite_get_width(spr_palette) - 2);
        }
        
        with (obj_palexample)
        {
            instance_create_depth(x, y, -6, obj_poofeffect);
            
            if (other.character == "P")
                sprite_index = spr_pizzelleselectedpal;
            else if (other.character == "N")
                sprite_index = spr_pizzanoselectedpal;
            
            image_index = 0;
        }
    }
    
    with (obj_playerhatselect)
    {
        if (other.move2 != 0)
            Selection = wrap(image_index + other.move2, 0, arrayEnd - 1);
    }
    
    if (key_slap2 || key_start2 || keyboard_check_pressed(vk_enter) || key_jump)
    {
        obj_playerhat.image_index = obj_playerhatselect.Selection;
        state = states.normal;
        targetRoom = hub_new;
        targetDoor = "C";
        instance_create(x, y, obj_fadeout);
    }
    
    with (obj_palexample)
    {
        if (other.character == "N" && sprite_index != spr_pizzanoselectedpal)
            sprite_index = spr_pizzanoselectpal;
        else if (other.character == "P" && sprite_index != spr_pizzelleselectedpal)
            sprite_index = spr_pizzelleselectpal;
    }
    
    sprite_index = spr_idle;
}
