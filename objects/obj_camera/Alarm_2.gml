var _oldcollect = global.collect - global.comboscore;

if (global.panic)
{
    if (global.seconds == 0 && global.minutes == 0)
    {
        if (_oldcollect > 0)
        {
            global.collect -= 20;
            
            if ((global.collect - global.comboscore) < 0)
                global.collect = global.comboscore;
            
            with (instance_create(0, 0, obj_negativenumber))
                number = string(global.collect - global.comboscore - _oldcollect);
        }
    }
}

alarm[2] = 60;
