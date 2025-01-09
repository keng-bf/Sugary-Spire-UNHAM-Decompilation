text = "";
type = "";
alpha = 0;
depth = -901;
finish = 0;
timer = 200;
obj_tv.showtext = 0;
movexscale = 1;
movesprite = spr_keyfont;
obj_tv.showtext = false;
previousID = -4;

if (instance_number(object_index) > 1)
{
    var b = instance_find(object_index, instance_number(object_index) - 2);
    
    if (instance_exists(b))
        previousID = b;
}

if (!global.showhud)
    visible = false;
