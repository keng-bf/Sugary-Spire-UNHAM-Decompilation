function scr_player_backkick()
{
    movespeed = 0;
    mach2 = 0;
    jumpAnim = true;
    dashAnim = true;
    landAnim = false;
    moveAnim = true;
    stopAnim = true;
    crouchslideAnim = true;
    crouchAnim = true;
    
    if (floor(image_index) == (image_number - 1))
        state = states.normal;
    
    sprite_index = spr_backkick;
    image_speed = 0.35;
}
