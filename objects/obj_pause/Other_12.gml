if (room != rank_room && room != hub_room1 && room != hub_public && room != outer_room1 && room != outer_room2 && room != scootercutsceneidk && room != rm_verify && room != secrets_await && room != hub_start && room != hub_hall && room != hub_new && room != devroom && room != rm_credits && room != room_test3)
{
    global.gamepaused = 0;
    pause = 0;
    instance_activate_all();
    scr_playerreset();
    
    with (obj_tv)
        tvsprite = spr_tvoff;
    
    global.levelname = -4;
    global.layout = 1;
    
    with (obj_player)
    {
        backtohub = 1;
        state = states.backtohub;
        hsp = 0;
        vsp = -18;
        sprite_index = spr_player_outofcontrolfall;
        
        if (character == "N")
            sprite_index = spr_pizzano_outofcontrolfall;
        
        scr_sound(bananaslip);
        
        if (room == room_levelselect)
        {
            backtoroom = hub_start;
            vsp = 0;
            state = states.comingoutdoor;
            hubx = 434;
            huby = 402;
            audio_stop_sound(bananaslip);
        }
        
        x = hubx;
        y = huby;
        room = backtoroom;
        grounded = false;
        image_index = 0;
    }
    
    with (instance_create(x, y, obj_fadeout))
    {
        fadealpha = 1;
        fadein = true;
    }
}
else if (room == hub_room1 || room == hub_public || room == outer_room1 || room == outer_room2 || room == scootercutsceneidk || room == secrets_await || room == devroom || room == hub_start || room == hub_hall || room == hub_new || room == rm_credits || room == room_test3)
{
    global.gateclosed = 0;
    global.gamepaused = 0;
    pause = 0;
    instance_activate_all();
    scr_playerreset();
    room = realtitlescreen;
    
    with (obj_player)
    {
        scr_characterspr();
        state = states.titlescreen;
    }
    
    with (obj_tv)
        tvsprite = spr_tvoff;
    
    with (obj_player)
        targetDoor = "A";
    
    with (instance_create(x, y, obj_fadeout))
    {
        fadealpha = 1;
        fadein = true;
    }
    
    global.levelname = -4;
}
else
{
    scr_sound(sound_enemythrow);
}
