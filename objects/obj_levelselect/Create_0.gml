image_index = 1;
image_speed = 0;
levelarr[0][0] = ["Crunchy Construction", entryway_1, "entryway", mu_waffle, false];
levelarr[0][1] = ["Cottontown", steamy_1, "steamy", mu_steamy, false];
levelarr[0][2] = ["Molasses Swamp", molasses_1, "molasses", mu_swamp, false];
levelarr[0][3] = ["Sugarshack Mines", mines_1, "mines", mu_mineshaft1, false];
levelarr[1][0] = ["New Crunchy Construction", entrywaynew_1, "entryway", mu_waffle, true];
levelarr[1][1] = ["New Cottontown", steamynew_1, "steamy", mu_steamy, true];
worldarr = ["Old", "New"];
level = 0;
world = 0;
prevlevel = 0;
prevworld = 0;
confecti_sprs[0] = 
{
    sprite: spr_marshmellow_taunt,
    image: choose(0, 1)
};
confecti_sprs[1] = 
{
    sprite: spr_chocolate_taunt,
    image: choose(0, 1)
};
confecti_sprs[2] = 
{
    sprite: spr_crack_taunt,
    image: choose(0, 1)
};
confecti_sprs[3] = 
{
    sprite: spr_gummyworm_taunt,
    image: choose(0, 1)
};
confecti_sprs[4] = 
{
    sprite: spr_candy_taunt,
    image: choose(0, 1)
};
musicbuffer = 10;
obj_player.backtohub = 0;
audio_stop_sound(bananaslip);
