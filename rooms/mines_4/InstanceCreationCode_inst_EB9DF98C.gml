flags.do_once_per_save = true;

condition = function()
{
    return ds_list_find_index(global.saveroom, 107313) != -1 && !global.minesProgress;
};

output = function()
{
    global.minesProgress = true;
    obj_music.fadeoff = 0;
    audio_stop_all_music();
};
