draw_set_alpha(image_alpha);
draw_set_color(c_red);
var font = font_add_sprite_ext(spr_fancynumber_font, "0123456789-", 1, 0);
draw_set_font(font);
draw_text(210, 50 - crap, number);
draw_set_alpha(1);
draw_set_color(c_white);
