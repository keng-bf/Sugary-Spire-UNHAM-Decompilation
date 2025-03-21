with (obj_player)
{
    if (other.image_yscale == 1)
    {
        if (((key_down && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, other.id) && (state == states.crouch || state == states.machroll)) || ((state == states.crouchslide || state == states.freefall || state == states.freefallland) && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, other.id))) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
        {
            other.depth = -10;
            scr_sound(sound_box);
            obj_player.box = 1;
            mach2 = 0;
            obj_camera.chargecamera = 0;
            x = other.x;
            obj_player.targetDoor = other.targetDoor;
            obj_player.targetRoom = other.targetRoom;
            
            if (character == "N")
                sprite_index = spr_pizzano_downpizzabox;
            else
                sprite_index = spr_player_downpizzabox;
            
            image_index = 0;
            state = states.door;
            image_speed = 0.35;
        }
    }
    
    if (other.image_yscale == -1)
    {
        if ((((key_up || state == states.Sjump || state == states.climbwall) && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 1, other.id) && (state == states.jump || state == states.uppercut || state == states.Sjump || state == states.climbwall)) && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 1, other.id)) && !instance_exists(obj_fadeout))
        {
            scr_sound(sound_box);
            other.depth = -10;
            obj_player.box = 1;
            other.depth = -8;
            mach2 = 0;
            obj_camera.chargecamera = 0;
            x = other.x;
            obj_player.targetDoor = other.targetDoor;
            obj_player.targetRoom = other.targetRoom;
            
            if (character == "N")
                sprite_index = spr_pizzano_uppizzabox;
            else
                sprite_index = spr_player_uppizzabox;
            
            image_index = 0;
            state = states.door;
            image_speed = 0.35;
        }
    }
}
