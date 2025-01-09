if (!finish)
{
    if (!instance_exists(previousID))
    {
        alpha = approach(alpha, 1, 0.1);
        
        if (obj_tv.showtext)
            finish = true;
        
        if (timer > 0)
            timer--;
        else
            finish = true;
    }
    else if (previousID.timer >= 20)
    {
        previousID.finish = true;
    }
}
else
{
    alpha = approach(alpha, 0, 0.1);
    
    if (alpha == 0)
        instance_destroy();
}

if (sign(obj_player.xscale) == -1)
{
    movexscale = key_get(global.key_left);
    movesprite = keysprite_get(global.key_left);
}
else if (sign(obj_player.xscale) == 1)
{
    movexscale = key_get(global.key_right);
    movesprite = keysprite_get(global.key_right);
}

if (global.showhud)
    visible = true;
else
    visible = false;
