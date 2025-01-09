var random1 = random_range(-1, 1);
var random2 = random_range(-1, 1);
draw_sprite(sprite_index, 0, 480 + random1, y + random2);

if (sprite_index == spr_lapextraPZ)
{
    var font = font_add_sprite_ext(spr_lapextrafont, "1234567890", 1, 1);
    draw_set_font(font);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text(502 + random1, y + 50 + random2, string(global.lapcount + 1));
}
