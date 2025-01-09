condition = function()
{
    return place_meeting(x, y, obj_player) && obj_player.state == 72;
};

output = function()
{
    inst_434100A4.alarm[1] = 5;
    inst_045F8434.alarm[1] = 10;
    inst_271D4CF4.alarm[1] = 1;
};
