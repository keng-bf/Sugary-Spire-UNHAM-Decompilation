if (collectvanish == true && collectboxid.activated == true)
{
    x = xstart;
    y = ystart;
    instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_cloudeffect);
    
    repeat (3)
        instance_create(x + (sprite_width / 2) + random_range(-5, 5), y + (sprite_height / 2) + random_range(-5, obj_ridetest3), obj_cloudeffect);
    
    collectvanish = false;
    in_the_void = false;
}

if (global.panic)
    image_alpha = 1;

depth = (place_meeting(x, y, obj_destructibles) || place_meeting(x, y, obj_metalblock)) ? 102 : 2;

if (global.collectsound < 10)
    global.collectsound += 1;
