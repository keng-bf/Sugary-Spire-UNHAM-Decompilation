timer += 20;
var old_x = xoffset;
xoffset = Wave(-40, 40, 2, 10, timer);
yoffset = Wave(-30, 48, 4, 10, timer);
x = obj_player.x + xoffset;
y = obj_player.y + yoffset;

if (xoffset != old_x)
    depth = (sign(old_x - xoffset) == 1) ? -5 : -12;

if (!global.key_inv)
    instance_destroy();
