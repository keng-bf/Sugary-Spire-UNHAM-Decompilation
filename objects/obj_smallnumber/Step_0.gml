if (!flash && scale)
{
    image_xscale = approach(image_xscale, 2, 0.2);
    image_yscale = approach(image_yscale, 2, 0.2);
}
else if (flash && scale)
{
    image_xscale = approach(image_xscale, 0, 0.2);
    image_yscale = approach(image_yscale, 0, 0.2);
}

if (!image_xscale && !image_yscale)
    instance_destroy();
