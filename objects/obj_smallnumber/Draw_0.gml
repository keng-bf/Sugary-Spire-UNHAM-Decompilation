switch (color)
{
    case c_black:
        draw_set_color(make_colour_rgb(255, 255, 255));
        break;
    
    case #010000:
        draw_set_color(make_colour_rgb(248, 0, 0));
        break;
    
    case #020000:
        draw_set_color(make_colour_rgb(0, 248, 0));
        break;
    
    case #030000:
        draw_set_color(make_colour_rgb(0, 0, 248));
        break;
    
    case #040000:
        draw_set_color(make_colour_rgb(0, 0, 0));
        break;
    
    case #050000:
        draw_set_color(make_colour_rgb(244, 144, 0));
        break;
}

draw_set_font(global.smallfont);
draw_set_halign(fa_center);
shader_reset();

if (flash)
{
    shader_set(shd_hit);
    draw_text_transformed(x, y, number, image_xscale, image_yscale, 0);
    shader_reset();
}
else
{
    draw_text_transformed(x, y, number, image_xscale, image_yscale, 0);
}
