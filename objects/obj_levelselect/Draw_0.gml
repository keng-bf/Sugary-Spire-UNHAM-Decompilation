var levelinfo = levelarr[world][level];
draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, 1);
draw_set_font(global.smallfont);
draw_set_halign(fa_center);
draw_set_color(c_white);
ini_open(global.charsave);
draw_set_alpha(1);
draw_text(x, y - 80 - 40, string(ini_read_string("Highscore", string(levelinfo[2]), 0)) + " POINTS - " + string(ini_read_string("Laps", string(levelinfo[2]), 0)) + " LAPS");
draw_text(x, (y - 117 - 40) + 12, ini_read_string("Secret", string(levelinfo[2]), 0) + " OF 3 SECRETS");

for (var i = 0; i < 5; i++)
{
    var x_pos = -100 + (50 * i);
    var collected = ini_read_string("Confecti", string(levelinfo[2]) + string(i + 1), 0);
    
    if (!collected)
        draw_sprite_ext_flash(confecti_sprs[i].sprite, confecti_sprs[i].image, x + x_pos, (y - 170 - 40) + 12, 1, 1, 0, 0, 1);
    else
        draw_sprite_ext(confecti_sprs[i].sprite, confecti_sprs[i].image, x + x_pos, (y - 170 - 40) + 12, 1, 1, 0, c_white, 1);
}

var rankindex = rank_checker(ini_read_string("Ranks", string(levelinfo[2]), "d"));

if (ini_read_real("Lap3", string(levelinfo[2]), 0) != 0)
{
    draw_sprite(spr_ranks_hud_pz, rankindex, (x + 3) - 32, y - 25 - 40);
    draw_sprite(spr_lap3_hud, 1, x + 3 + 32, y - 27 - 40);
}
else if (ini_read_string("Ranks", string(levelinfo[2]), "none") != "none")
{
    draw_sprite(spr_ranks_hud_pz, rankindex, x + 3, y - 25 - 40);
}

ini_close();
draw_set_font(global.newfont);
draw_text(x + random_range(-1, 1), 485 + random_range(-1, 1), levelinfo[0]);
