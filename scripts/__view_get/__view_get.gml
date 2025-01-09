function __view_get(argument0, argument1)
{
    var __res = -1;
    
    switch (argument0)
    {
        case 0:
            var __cam = view_get_camera(argument1);
            __res = camera_get_view_x(__cam);
            break;
        
        case 1:
            var __cam = view_get_camera(argument1);
            __res = camera_get_view_y(__cam);
            break;
        
        case 2:
            var __cam = view_get_camera(argument1);
            __res = camera_get_view_width(__cam);
            break;
        
        case 3:
            var __cam = view_get_camera(argument1);
            __res = camera_get_view_height(__cam);
            break;
        
        case 4:
            var __cam = view_get_camera(argument1);
            __res = camera_get_view_angle(__cam);
            break;
        
        case 5:
            var __cam = view_get_camera(argument1);
            __res = camera_get_view_border_x(__cam);
            break;
        
        case 6:
            var __cam = view_get_camera(argument1);
            __res = camera_get_view_border_y(__cam);
            break;
        
        case 7:
            var __cam = view_get_camera(argument1);
            __res = camera_get_view_speed_x(__cam);
            break;
        
        case 8:
            var __cam = view_get_camera(argument1);
            __res = camera_get_view_speed_y(__cam);
            break;
        
        case 9:
            var __cam = view_get_camera(argument1);
            __res = camera_get_view_target(__cam);
            break;
        
        case 10:
            __res = view_get_visible(argument1);
            break;
        
        case 11:
            __res = view_get_xport(argument1);
            break;
        
        case 12:
            __res = view_get_yport(argument1);
            break;
        
        case 13:
            __res = view_get_wport(argument1);
            break;
        
        case 14:
            __res = view_get_hport(argument1);
            break;
        
        case 15:
            __res = view_get_camera(argument1);
            break;
        
        case 16:
            __res = view_get_surface_id(argument1);
            break;
        
        default:
            break;
    }
    
    return __res;
}
