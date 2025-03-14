function scr_slopeangle(argument0 = x, argument1 = y)
{
    var array = 0;
    var checkside = -1;
    var height = sprite_get_bbox_bottom(mask_index) - sprite_get_bbox_top(mask_index);
    var top = -3;
    var i = 0;
    array[0] = y;
    array[1] = y;
    
    while (i < 2)
    {
        while (top < height)
        {
            array[i] = y;
            var check_1 = scr_solid_player(x + (3 * checkside), y + top);
            var check_2 = !scr_solid_player(x + (3 * checkside), (y + top) - 1);
            
            if (check_1 && check_2)
            {
                var sex = (y + top) - 1;
                array[i] = sex;
                break;
            }
            
            top++;
        }
        
        checkside = !checkside;
        i++;
    }
    
    var pointer1 = array[0];
    var pointer2 = array[1];
    var _angle = 0;
    
    if (pointer1 != pointer2)
        _angle = point_direction(x - 3, pointer1, x + 3, pointer2);
    
    return _angle;
}

function scr_slopeanglenonplayer(argument0, argument1)
{
    var array = 0;
    var checkside = -1;
    var height = sprite_get_bbox_bottom(mask_index) - sprite_get_bbox_top(mask_index);
    var top = -3;
    var i = 0;
    array[0] = argument1;
    array[1] = argument1;
    
    while (i < 2)
    {
        while (top < height)
        {
            array[i] = argument1;
            var check_1 = scr_solid(argument0 + (1 * checkside), argument1 + top);
            var check_2 = !scr_solid(argument0 + (1 * checkside), (argument1 + top) - 1);
            
            if (check_1 && check_2)
            {
                var sex = (argument1 + top) - 1;
                array[i] = sex;
                break;
            }
            
            top++;
        }
        
        checkside = !checkside;
        i++;
    }
    
    var pointer1 = array[0];
    var pointer2 = array[1];
    var _angle = 0;
    
    if (pointer1 != pointer2)
        _angle = point_direction(argument0 - 1, pointer1, argument0 + 1, pointer2);
    
    return _angle;
}
