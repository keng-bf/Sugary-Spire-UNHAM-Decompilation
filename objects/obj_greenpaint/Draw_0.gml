var select = 0;

if (obj_player.character == "N")
    select = 1;

pal_swap_set(spr_greenpaintpal, select);
draw_self();
pal_swap_reset();
