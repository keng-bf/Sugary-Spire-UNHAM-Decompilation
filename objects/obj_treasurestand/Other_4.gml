ini_open(global.charsave);
levelrank = ini_read_string("Treasure", string(levelsign), 0);
ini_close();

if (levelrank == "1" || levelrank == 1)
{
    switch (levelsign)
    {
        case "entryway":
            index = 0;
            break;
        
        case "steamy":
            index = 1;
            break;
        
        case "molasses":
            index = 2;
            break;
        
        case "mines":
            index = 3;
            break;
    }
}
