drawy = wave(ystart - 5, ystart + 5, 2, 2);

if (levelrank == "1" || levelrank == 1)
    draw_sprite(spr_treasure, index, x - ((sprite_get_width(spr_treasure) / 2) - 5), drawy);

draw_self();
