if (!instance_exists(ID))
    instance_destroy();

if (instance_exists(ID))
{
    x = ID.x;
    y = ID.y;
    image_xscale = ID.image_xscale;
    image_index = ID.image_index;
    
    with (ID)
    {
        switch (object_index)
        {
            case obj_cottonwitch:
                if (state != baddiestates.witchattack)
                {
                    hitboxcreate = false;
                    instance_destroy(other.id);
                }
                
                break;
        }
    }
}
