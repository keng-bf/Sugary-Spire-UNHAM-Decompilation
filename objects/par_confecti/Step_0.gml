if (obj_player.x != x)
    drawxscale = -sign(x - obj_player.x);

switch (state)
{
    case confectistates.normal:
        scr_confecti_normal();
        break;
    
    case confectistates.taunt:
        scr_confecti_taunt();
        break;
    
    case confectistates.appear:
        scr_confecti_appear();
        break;
}

if (room == rank_room)
    visible = false;

image_yscale = obj_player.yscale * obj_player.scale_ys;
drawxscal = obj_player.scale_ys * image_xscale;
