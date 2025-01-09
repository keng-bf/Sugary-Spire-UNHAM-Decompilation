if (!instance_exists(playerID))
    exit;

with (other)
{
    with (other.playerID)
        scr_instakill();
}
