if (!instance_exists(ID) || (other.sprite_index == spr_player_dive && other.movespeed > 12))
    exit;

event_inherited();
