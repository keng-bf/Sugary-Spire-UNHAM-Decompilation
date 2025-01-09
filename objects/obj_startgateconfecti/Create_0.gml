image_speed = 0.35;
state = states.normal;
image_xscale = choose(-1, 1);
alarm[0] = 80 + irandom(70);
hsp = 0;
vsp = 0;
grav = 0.5;
depth = 1;

while (scr_solid(x, y))
    y--;

idlespr = spr_marshmellow_idle;
runspr = spr_marshmellow_run;
tauntspr = spr_marshmellow_taunt;
storedstate = states.normal;
storedsprite = idlespr;
