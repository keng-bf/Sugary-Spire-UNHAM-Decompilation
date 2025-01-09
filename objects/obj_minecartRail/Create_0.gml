depth = 4;

can_collide = function(argument0 = obj_player)
{
    if (argument0 == obj_player)
    {
        var wow = false;
        
        if ((argument0.ischaracter == "minecart" && argument0.state != states.freefall) || (argument0.state == states.minecart || argument0.state == states.minecartspin))
            wow = true;
        
        return wow;
    }
    else if (argument0 == obj_minecart || argument0 == obj_train)
    {
        return true;
    }
    else
    {
        return false;
    }
};
