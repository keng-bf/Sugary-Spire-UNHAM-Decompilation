var _oldcollect = global.collect - global.comboscore;

if (global.panic || global.timetrial)
{
    global.seconds -= 1;
    
    if (_oldcollect > 0)
    {
        global.collect -= 5;
        
        if ((global.collect - global.comboscore) < 0)
            global.collect = global.comboscore;
        
        with (instance_create(0, 0, obj_negativenumber))
            number = string(global.collect - global.comboscore - _oldcollect);
    }
    
    if (global.seconds < 0)
    {
        global.seconds = 59;
        global.minutes -= 1;
    }
}

if (global.starrmode)
{
    global.seconds -= 1;
    
    if (global.seconds < 0)
    {
        global.seconds = 59;
        global.minutes -= 1;
    }
}

alarm[1] = 60;
