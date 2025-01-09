function scr_cutoff(argument0)
{
    if (!argument0)
    {
        with (instance_create(x, y, obj_cutoff))
            image_yscale = -1;
        
        instance_create(x, y + 32, obj_cutoff);
        
        with (instance_create(x, y, obj_cutoff))
            image_angle = -90;
        
        with (instance_create(x + 32, y + 32, obj_cutoff))
            image_angle = 90;
    }
    else if (abs(image_xscale) > 1 && abs(image_yscale) > 1)
    {
        with (instance_create(x + (sprite_width / 2), y, obj_cutoff))
        {
            image_yscale = -1;
            argument0 = 1;
            sprite_index = spr_cutoffbig;
            image_xscale = other.image_xscale;
        }
        
        with (instance_create(x + (sprite_width / 2), y + sprite_height, obj_cutoff))
        {
            argument0 = 1;
            sprite_index = spr_cutoffbig;
            image_xscale = other.image_xscale;
        }
        
        with (instance_create(x + sprite_width, y + (sprite_height / 2), obj_cutoff))
        {
            image_angle = 90;
            argument0 = 1;
            sprite_index = spr_cutoffbig;
            image_xscale = other.image_xscale;
        }
        
        with (instance_create(x, y + (sprite_width / 4), obj_cutoff))
        {
            image_angle = -90;
            argument0 = 1;
            sprite_index = spr_cutoffbig;
        }
        
        for (var i = 0; i < image_yscale; i++)
        {
            with (instance_create(x, y + ((sprite_height - (sprite_height / 4)) + (i * 32)), obj_cutoff))
            {
                image_angle = -90;
                image_index = 1;
                image_xscale = -1;
            }
        }
    }
    else if (id != 110964)
    {
        if (id != 101082 && id != 106043 && id != 110964 && id != 110831 && id != 110929)
        {
            with (instance_create(x + 32, y, obj_cutoff))
            {
                image_yscale = -1;
                argument0 = 1;
                sprite_index = spr_cutoffbig;
            }
        }
        
        if (id != 101088 && id != 106046 && id != 110966 && id != 110832 && id != 110930)
        {
            with (instance_create(x + 32, y + 64, obj_cutoff))
            {
                argument0 = 1;
                sprite_index = spr_cutoffbig;
            }
        }
        
        with (instance_create(x + 64, y + 32, obj_cutoff))
        {
            image_angle = 90;
            argument0 = 1;
            sprite_index = spr_cutoffbig;
        }
        
        with (instance_create(x, y + 32, obj_cutoff))
        {
            image_angle = -90;
            argument0 = 1;
            sprite_index = spr_cutoffbig;
        }
    }
}
