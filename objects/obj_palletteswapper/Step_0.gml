if (obj_player.paletteselect == 17)
{
    obj_player.paletteselect = 1;
    scr_sound(sound_paintsplash);
}

draw_set_font(global.smallfont);

if (obj_player.character == "P")
{
    switch (obj_player.paletteselect)
    {
        case 0:
            palettename = "HOW DID YOU GET THIS";
            break;
        
        case 1:
            palettename = "DEFAULT";
            break;
        
        case 2:
            palettename = "SUGAR";
            break;
        
        case 3:
            palettename = "FAMILIAR GREMLIN";
            break;
        
        case 4:
            palettename = "MASSACRE";
            break;
        
        case 5:
            palettename = "RIVALS";
            break;
        
        case 6:
            palettename = "GUM";
            break;
        
        case 7:
            palettename = "OLD SCHOOL";
            break;
        
        case 8:
            palettename = "ZOMBIFIED";
            break;
        
        case 9:
            palettename = "FORESTATION";
            break;
        
        case 10:
            palettename = "LAMDA";
            break;
        
        case 11:
            palettename = "GOLDEN";
            break;
        
        case 12:
            palettename = "GNOME WIZARD";
            break;
        
        case 13:
            palettename = "FROSTBURN";
            break;
        
        case 14:
            palettename = "COTTONCOATED";
            break;
        
        case 15:
            palettename = "DRIZZELLE";
            break;
        
        case 16:
            palettename = "LOADING INTO SPIRE";
            break;
        
        case 17:
            palettename = "RELEASE THE GREENZELLE";
            break;
    }
}
else if (obj_player.character == "N")
{
    switch (obj_player.paletteselect)
    {
        case 0:
            palettename = "HOW DID YOU GET THIS";
            break;
        
        case 1:
            palettename = "DEFAULT";
            break;
        
        case 2:
            palettename = "FAMILIAR GREMLIN";
            break;
        
        case 3:
            palettename = "FAMILIAR CHEF";
            break;
        
        case 4:
            palettename = "LASAGNA";
            break;
        
        case 5:
            palettename = "SPICE";
            break;
        
        case 6:
            palettename = "PLUMBER";
            break;
        
        case 7:
            palettename = "GREEN APPLE";
            break;
        
        case 8:
            palettename = "GRAPE SODA";
            break;
        
        case 9:
            palettename = "ANTIPATHIC";
            break;
        
        case 10:
            palettename = "GUMMY BEAR";
            break;
        
        case 11:
            palettename = "LIME";
            break;
        
        case 12:
            palettename = "CRYSTALIZED";
            break;
        
        case 13:
            palettename = "VOICE OF PEOPLE";
            break;
        
        case 14:
            palettename = "PIZZAYES";
            break;
        
        case 15:
            palettename = "PINZANTO";
            break;
        
        case 16:
            palettename = "CHOCOLATE AMPHIBIAN";
            break;
        
        case 17:
            palettename = "RED BOY";
            break;
    }
}
else if (obj_player.character == "G")
{
    switch (obj_player.paletteselect)
    {
        case 0:
            palettename = "HOW DID YOU GET THIS";
            break;
        
        case 1:
            palettename = "DEFAULT";
            break;
        
        case 2:
            palettename = "FAMILIAR SLIME";
            break;
        
        case 3:
            palettename = "RAGE";
            break;
        
        case 4:
            palettename = "RAT";
            break;
        
        case 5:
            palettename = "RETRO";
            break;
        
        case 6:
            palettename = "CLOUDY DAY";
            break;
        
        case 7:
            palettename = "SADNESS";
            break;
    }
}

if (drawing)
{
    if (bgblend != 1)
        bgblend += 0.1;
    
    if (fally != 0)
        fally += 60;
}
else if (!drawing)
{
    if (bgblend != 0)
        bgblend -= 0.1;
    
    if (fally != -540)
        fally -= 60;
}

if (fally == 0)
{
    if (textblend != 1)
        textblend += 0.1;
}

if (fally > 0)
    textblend = 0;
