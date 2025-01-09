selected = 0;
lightX = 96;
abletomove = false;
alarm[0] = 10;
depth = 250;
xi = 480;
yi = 600;
drawx = room_width / 2;
showtext = false;
_message = "";
charicon = spr_pizzelle_switch;
charindex = 0;
icon_y = 0;
icon_y_buffer = 0;
pizzano_unlocked = 0;
char_select = 1;
prevcharselect = 1;

unlock_pizzano = function(argument0)
{
    ini_open("optionData.ini");
    
    if (ini_read_real("Game", "creditsunlocked", 0) == 1)
    {
        if (ini_read_real("Game", "pizzaunlocked", 0) == 0)
        {
            ini_write_real("Game", "pizzaunlocked", 1);
            instance_create(0, 0, obj_pizzanounlocked);
            
            if (!instance_exists(obj_saveicon))
            {
                instance_create_depth(0, 0, -1000, obj_saveicon);
            }
            else
            {
                with (obj_saveicon)
                    finishbuffer = 200;
            }
        }
        
        pizzano_unlocked = 1;
    }
    
    ini_close();
};

unlock_pizzano(false);
game_started = 0;
prevselected = 0;
showpizzano = 0;
menuindex = 0;

delete_emptysave = function(argument0)
{
    ini_open(argument0);
    
    if (!ini_section_exists("Ranks") && !ini_section_exists("Confecti") && !ini_section_exists("Treasure") && !ini_section_exists("Secret") && !ini_section_exists("Highscore") && file_exists(argument0))
        file_delete(argument0);
    
    ini_close();
};

delete_emptysave("saveData.ini");
delete_emptysave("saveData_2.ini");
delete_emptysave("saveData_3.ini");
delete_emptysave("saveDataN_1.ini");
delete_emptysave("saveDataN_2.ini");
delete_emptysave("saveDataN_3.ini");
delete_emptysave("saveData_test.ini");
testcode = "";
testcodeconfirm = 0;
extrasave = 0;
