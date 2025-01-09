can_collide = function(argument0 = obj_player)
{
    if (argument0 == obj_player)
    {
        var wow = (argument0.state == states.cotton && argument0.sprite_index != spr_cotton_drill && argument0.sprite_index != spr_cottonPizzano_wallclimb && argument0.sprite_index != spr_cottonPizzano_fastfall) || argument0.state == states.cottonroll;
        return wow;
    }
    else
    {
        return true;
    }
};
