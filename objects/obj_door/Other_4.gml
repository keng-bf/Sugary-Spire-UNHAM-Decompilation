if (place_meeting(x, y, obj_player))
    visited = true;

with (instance_place(x, y, obj_doortrigger_parent))
    other.targetDoor = id_door;

if (visited && sprite_index != spr_dresser && sprite_index != spr_lightdoor && sprite_index != spr_doorlevelselect && sprite_index != spr_steamydoor)
{
    sprite_index = spr_door;
}
else if (visited && sprite_index == spr_lightdoor)
{
    sprite_index = spr_door;
    visible = false;
}
