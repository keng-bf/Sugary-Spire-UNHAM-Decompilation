can_collide = function(argument0 = obj_player)
{
    if (argument0 == obj_player)
    {
        if (argument0.state == states.cotton || argument0.state == states.cottondrill || argument0.state == states.cottonroll)
            return false;
        
        return true;
    }
    else
    {
        return true;
    }
};

with (instance_create(x, y, obj_cottonplatform))
{
    sprite_index = spr_wall;
    image_xscale = other.image_xscale;
    image_yscale = other.image_yscale;
    visible = false;
}
