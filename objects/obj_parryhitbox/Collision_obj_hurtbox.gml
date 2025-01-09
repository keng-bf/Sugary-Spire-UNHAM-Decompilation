if (!instance_exists(playerID))
    exit;

if (playerID.sprite_index == playerID.spr_player_taunt)
{
    event_user(0);
    
    if (other.object_index == obj_pizzacutter)
    {
        with (other)
            angle *= -1;
    }
}

if (other.ID != -4)
    instance_destroy(other.ID);
