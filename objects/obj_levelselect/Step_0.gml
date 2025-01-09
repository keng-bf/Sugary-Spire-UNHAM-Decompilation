scr_getinput();

if (musicbuffer > 0)
    musicbuffer--;

if (!instance_exists(obj_fadeout))
{
    var move = key_down2 - key_up2;
    var move2 = key_left2 + key_right2;
    world += move;
    world = clamp(world, 0, array_length(levelarr) - 1);
    level += move2;
    level = clamp(level, 0, array_length(levelarr[world]) - 1);
    var levelinfo = levelarr[world][level];
    
    if (!audio_is_playing(levelinfo[3]))
    {
        audio_stop_all_music();
        scr_music(levelinfo[3]);
    }
    
    if (prevlevel != level || prevworld != world)
    {
        scr_sound(sound_step);
        prevlevel = level;
        prevworld = world;
    }
    
    with (obj_player)
    {
        movespeed = 0;
        hsp = 0;
        vsp = 0;
        state = states.titlescreen;
        backtohub = 0;
    }
    
    if ((key_jump2 || keyboard_check_pressed(vk_enter)) && !instance_exists(obj_fadeout))
    {
        levelinfo = levelarr[world][level];
        scr_playerreset();
        
        with (obj_player)
        {
            global.levelname = levelinfo[2];
            startroom = levelinfo[1];
            state = states.comingoutdoor;
            movespeed = 0;
            hsp = 0;
            vsp = 0;
            hubx = x;
            huby = y;
            backtoroom = room;
            targetRoom = levelinfo[1];
            targetDoor = "A";
            instance_create(x, y, obj_fadeout);
            global.layout = levelinfo[4];
        }
    }
}

if (instance_exists(obj_fadeout))
{
    with (obj_player)
        image_index = 0;
}
